//+------------------------------------------------------------------+
//|                                   SYMBOL MASTER PRO - Ultimate   |
//|                          Single Symbol Multi-Timeframe Analyzer  |
//|                    Master ONE Symbol Across ALL Timeframes       |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_plots 0
#property copyright "Symbol Master Pro - Ultimate Single Symbol System"
#property version   "2.01"
#property description "7-Timeframe Analysis | Confluence Scoring | High-Probability Signals"

//+------------------------------------------------------------------+
//| ENUMERATIONS                                                      |
//+------------------------------------------------------------------+
enum ENUM_SIGNAL_STYLE
{
   STYLE_BOX_PANEL = 0,      // A: Signal Box Panel
   STYLE_VERTICAL_ZONE = 1,  // B: Vertical Zone Markers
   STYLE_ADVANCED_LABEL = 2  // C: Advanced Label System
};

//+------------------------------------------------------------------+
//| INPUT PARAMETERS                                                  |
//+------------------------------------------------------------------+
input group "=== SYMBOL SELECTION ==="
input string TargetSymbol = "";  // Target Symbol (blank = current chart symbol)

input group "=== MULTI-SYMBOL MODE ==="
input bool EnableMultiSymbolMode = false;   // Enable Multi-Symbol Mode
input string Symbol1 = "EURUSD";            // Symbol 1
input string Symbol2 = "GBPUSD";            // Symbol 2
input string Symbol3 = "USDJPY";            // Symbol 3
input string Symbol4 = "AUDUSD";            // Symbol 4
input string Symbol5 = "USDCAD";            // Symbol 5
input string Symbol6 = "NZDUSD";            // Symbol 6
input string Symbol7 = "EURGBP";            // Symbol 7
input string Symbol8 = "EURJPY";            // Symbol 8
input string Symbol9 = "GBPJPY";            // Symbol 9
input string Symbol10 = "XAUUSD";           // Symbol 10
input int MultiSymbolCompactSize = 180;     // Compact Dashboard Height

input group "=== MULTI-TIMEFRAME ANALYSIS ==="
input bool AnalyzeM1 = true;      // Analyze M1 Timeframe
input bool AnalyzeM5 = true;      // Analyze M5 Timeframe
input bool AnalyzeM15 = true;     // Analyze M15 Timeframe
input bool AnalyzeM30 = true;     // Analyze M30 Timeframe
input bool AnalyzeH1 = true;      // Analyze H1 Timeframe
input bool AnalyzeH4 = true;      // Analyze H4 Timeframe
input bool AnalyzeD1 = true;      // Analyze D1 Timeframe

input group "=== STRATEGY PARAMETERS ==="
input int StructureLookback = 30;              // Structure Lookback Bars
input int OrderBlockLookback = 20;             // Order Block Lookback
input double MinOrderBlockStrength = 0.3;      // Min OB Strength (30%)
input int FVGMinSizePips = 3;                  // FVG Minimum Size (pips)
input int SwingLookback = 10;                  // Swing Point Lookback
input int TrendMAPeriod = 100;                 // Trend MA Period
input double MinTrendStrength = 0.3;           // Min Trend Strength

input group "=== CONFLUENCE SETTINGS ==="
input int MinConfluenceScore = 7;              // Min Confluence Score (1-10)
input bool RequireHTFAlignment = true;         // Require Higher TF Alignment
input bool RequireMultipleTFConfirmation = true; // Require Multiple TF Confirmation
input int MinConfirmingTimeframes = 3;         // Min Confirming Timeframes

input group "=== VISUAL DASHBOARD ==="
input bool ShowDashboard = true;               // Show Multi-TF Dashboard
input int DashboardXPos = 20;                  // Dashboard X Position
input int DashboardYPos = 80;                  // Dashboard Y Position
input bool ShowConfluencePanel = true;         // Show Confluence Panel
input bool ShowSignalPanel = true;             // Show Signal Alert Panel
input color DashboardBackground = clrDarkSlateGray; // Dashboard Background
input color DashboardBorder = clrGold;         // Dashboard Border

input group "=== MINI-CHART SETTINGS ==="
input color MinChartBullishColor = clrLime;    // Mini-Chart Bullish Candle Color
input color MinChartBearishColor = clrRed;     // Mini-Chart Bearish Candle Color
input color MinChartBackground = C'20,20,30';  // Mini-Chart Background Color

input group "=== SIGNAL GENERATION ==="
input bool GenerateSignals = true;             // Generate Trade Signals
input double MinRiskReward = 2.0;              // Minimum Risk:Reward Ratio
input int StopLossPips = 150;                  // Stop Loss (pips)
input bool DrawSignalsOnChart = true;          // Draw Signals on Chart
input bool AlertOnSignal = true;               // Alert on New Signal

input group "=== SIGNAL DISPLAY STYLE ==="
input ENUM_SIGNAL_STYLE SignalDisplayStyle = STYLE_BOX_PANEL;  // Signal Display Style
input int SignalFontSize = 10;                 // Signal Text Size
input bool ShowSignalDetails = true;           // Show Detailed Info
input color ScalpSignalColor = clrDodgerBlue;  // Scalp Signal Color
input color IntradaySignalColor = clrOrange;   // Intraday Signal Color
input color SwingSignalColor = clrMagenta;     // Swing Signal Color

input group "=== TRADING EDGE FILTERS ==="
input bool UseHTFBiasFilter = true;            // Use Higher TF Bias Filter
input bool UseSessionFilter = false;           // Filter by Trading Session
input bool UseVolatilityFilter = true;         // Use ATR Volatility Filter
input double MinATRMultiplier = 0.5;           // Min ATR Multiplier
input double MaxATRMultiplier = 2.5;           // Max ATR Multiplier
input bool UseLiquiditySweepConfirm = true;    // Confirm Liquidity Sweeps

input group "=== VISUAL ON-CHART DISPLAY ==="
input bool DrawOrderBlocks = true;             // Draw Order Blocks
input bool DrawFairValueGaps = true;           // Draw Fair Value Gaps
input bool DrawMarketStructure = true;         // Draw Market Structure
input bool DrawLiquidityZones = true;          // Draw Liquidity Zones
input bool DrawKeyLevels = true;               // Draw Key Support/Resistance
input int MaxObjectsPerTF = 5;                 // Max Objects Per Timeframe

input group "=== ALERTS ==="
input bool EnableAlerts = true;                // Enable Popup Alerts
input bool EnablePushNotifications = false;    // Enable Push Notifications
input bool AlertOnConfluence = true;           // Alert on High Confluence
input bool EnableSoundAlerts = true;           // Enable Sound Alerts
input bool ShowAlertTimestamp = true;          // Show Signal Timestamp
input bool ShowSignalArchive = true;           // Show Signal History Panel

//+------------------------------------------------------------------+
//| STRUCTURES                                                        |
//+------------------------------------------------------------------+
struct TimeframeAnalysis
{
   ENUM_TIMEFRAMES timeframe;
   string tfName;
   
   // Trend
   bool isBullish;
   bool isBearish;
   double trendStrength;
   
   // Structure
   double lastSwingHigh;
   double lastSwingLow;
   bool bosOccurred;
   bool chochOccurred;
   
   // Order Blocks
   int bullishOBCount;
   int bearishOBCount;
   double strongestBullOB;
   double strongestBearOB;
   
   // Fair Value Gaps
   int bullishFVGCount;
   int bearishFVGCount;
   double nearestBullFVG;
   double nearestBearFVG;
   
   // Liquidity
   double buyLiquidity;
   double sellLiquidity;
   
   // Overall Bias
   int bias; // 1=Bullish, 0=Neutral, -1=Bearish
   int confidence; // 0-10
};

struct OrderBlock
{
   datetime time;
   double highPrice;
   double lowPrice;
   bool isBullish;
   double strength;
   ENUM_TIMEFRAMES timeframe;
   bool touched;
};

struct FairValueGap
{
   datetime time;
   double topPrice;
   double bottomPrice;
   bool isBullish;
   double fillPercent;
   ENUM_TIMEFRAMES timeframe;
};

enum ENUM_SIGNAL_PERSPECTIVE
{
   PERSPECTIVE_SCALP = 0,     // Scalp (5-15 min hold)
   PERSPECTIVE_INTRADAY = 1,  // Intraday (1-4 hour hold)
   PERSPECTIVE_SWING = 2      // Swing (days hold)
};

struct ConfluenceSignal
{
   datetime time;
   bool isBuy;
   double entryPrice;
   double stopLoss;
   double takeProfit;
   int confluenceScore;
   string confirmingTFs;
   string setupDescription;
   double riskReward;
   ENUM_SIGNAL_PERSPECTIVE perspective;
   string perspectiveText;
   string holdTime;
   int tfWeight;  // Weighted score based on TF importance
   bool passedFilters;  // Did it pass all edge filters
};

//+------------------------------------------------------------------+
//| GLOBAL VARIABLES                                                  |
//+------------------------------------------------------------------+
string g_Symbol;
TimeframeAnalysis g_TFAnalysis[7];
ENUM_TIMEFRAMES g_Timeframes[7];
int g_ActiveTFCount = 0;

OrderBlock g_AllOrderBlocks[];
int g_OBCount = 0;
FairValueGap g_AllFVGs[];
int g_FVGCount = 0;

ConfluenceSignal g_CurrentSignal;
bool g_SignalActive = false;
ENUM_SIGNAL_STYLE g_ActiveSignalStyle = STYLE_BOX_PANEL;  // Runtime display style

// SIGNAL HISTORY SYSTEM - Keep track of multiple signals
#define MAX_SIGNAL_HISTORY 10
ConfluenceSignal g_SignalHistory[];
int g_SignalHistoryCount = 0;

// Indicator handles for each timeframe
int g_TrendMA_Handles[7];
int g_ATR_Handles[7];

datetime g_LastAnalysisTime = 0;
datetime g_LastSignalTime = 0;

// UI State
bool g_DashboardExpanded = true;
int g_ActiveMiniChart = -1;  // Index of timeframe with open mini chart (-1 = none)
bool g_ShowSignalArchive = true;  // Show signal archive panel

// MULTI-SYMBOL MODE VARIABLES
#define MAX_MULTI_SYMBOLS 10
bool g_MultiSymbolMode = false;  // Runtime mode flag
string g_MultiSymbols[MAX_MULTI_SYMBOLS];  // Array of symbols to analyze
int g_MultiSymbolCount = 0;

// Multi-symbol analysis data (10 symbols x 7 timeframes each)
TimeframeAnalysis g_MultiTFAnalysis[MAX_MULTI_SYMBOLS][7];
int g_MultiTrendMA_Handles[MAX_MULTI_SYMBOLS][7];
int g_MultiATR_Handles[MAX_MULTI_SYMBOLS][7];

// Multi-symbol signal tracking (10 symbols x 10 signals each)
ConfluenceSignal g_MultiSignalHistory[MAX_MULTI_SYMBOLS][MAX_SIGNAL_HISTORY];
int g_MultiSignalHistoryCount[MAX_MULTI_SYMBOLS];
ConfluenceSignal g_MultiCurrentSignal[MAX_MULTI_SYMBOLS];
bool g_MultiSignalActive[MAX_MULTI_SYMBOLS];
datetime g_MultiLastSignalTime[MAX_MULTI_SYMBOLS];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                          |
//+------------------------------------------------------------------+
int OnInit()
{
   // Set target symbol
   g_Symbol = (TargetSymbol == "" || TargetSymbol == "0") ? _Symbol : TargetSymbol;
   
   // Initialize timeframes array
   int tfIndex = 0;
   if(AnalyzeM1) g_Timeframes[tfIndex++] = PERIOD_M1;
   if(AnalyzeM5) g_Timeframes[tfIndex++] = PERIOD_M5;
   if(AnalyzeM15) g_Timeframes[tfIndex++] = PERIOD_M15;
   if(AnalyzeM30) g_Timeframes[tfIndex++] = PERIOD_M30;
   if(AnalyzeH1) g_Timeframes[tfIndex++] = PERIOD_H1;
   if(AnalyzeH4) g_Timeframes[tfIndex++] = PERIOD_H4;
   if(AnalyzeD1) g_Timeframes[tfIndex++] = PERIOD_D1;
   g_ActiveTFCount = tfIndex;
   
   if(g_ActiveTFCount == 0)
   {
      Alert("ERROR: No timeframes selected for analysis!");
      return(INIT_FAILED);
   }
   
   // Initialize indicator handles for each timeframe
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      g_TrendMA_Handles[i] = iMA(g_Symbol, g_Timeframes[i], TrendMAPeriod, 0, MODE_EMA, PRICE_CLOSE);
      g_ATR_Handles[i] = iATR(g_Symbol, g_Timeframes[i], 14);
      
      if(g_TrendMA_Handles[i] == INVALID_HANDLE || g_ATR_Handles[i] == INVALID_HANDLE)
      {
         Alert("ERROR: Failed to create indicators for timeframe");
         return(INIT_FAILED);
      }
      
      // Initialize timeframe analysis
      g_TFAnalysis[i].timeframe = g_Timeframes[i];
      g_TFAnalysis[i].tfName = GetTimeframeName(g_Timeframes[i]);
      g_TFAnalysis[i].bias = 0;
      g_TFAnalysis[i].confidence = 0;
   }
   
   // Enable chart events for mouse clicks
   ChartSetInteger(0, CHART_EVENT_MOUSE_MOVE, true);
   ChartSetInteger(0, CHART_EVENT_OBJECT_CREATE, true);
   ChartSetInteger(0, CHART_EVENT_OBJECT_DELETE, true);

   // Initialize active signal style from input parameter
   g_ActiveSignalStyle = SignalDisplayStyle;

   // Initialize signal history array
   ArrayResize(g_SignalHistory, MAX_SIGNAL_HISTORY);
   g_SignalHistoryCount = 0;
   g_ShowSignalArchive = ShowSignalArchive;

   // Initialize multi-symbol mode if enabled - MUST BE BEFORE DASHBOARD CREATION!
   g_MultiSymbolMode = EnableMultiSymbolMode;
   if(g_MultiSymbolMode)
   {
      // Build symbol list
      g_MultiSymbols[0] = Symbol1;
      g_MultiSymbols[1] = Symbol2;
      g_MultiSymbols[2] = Symbol3;
      g_MultiSymbols[3] = Symbol4;
      g_MultiSymbols[4] = Symbol5;
      g_MultiSymbols[5] = Symbol6;
      g_MultiSymbols[6] = Symbol7;
      g_MultiSymbols[7] = Symbol8;
      g_MultiSymbols[8] = Symbol9;
      g_MultiSymbols[9] = Symbol10;
      g_MultiSymbolCount = MAX_MULTI_SYMBOLS;

      // Initialize all multi-symbol data
      for(int symIdx = 0; symIdx < g_MultiSymbolCount; symIdx++)
      {
         // Initialize indicator handles for each symbol
         for(int i = 0; i < g_ActiveTFCount; i++)
         {
            g_MultiTrendMA_Handles[symIdx][i] = iMA(g_MultiSymbols[symIdx], g_Timeframes[i], TrendMAPeriod, 0, MODE_EMA, PRICE_CLOSE);
            g_MultiATR_Handles[symIdx][i] = iATR(g_MultiSymbols[symIdx], g_Timeframes[i], 14);

            if(g_MultiTrendMA_Handles[symIdx][i] == INVALID_HANDLE || g_MultiATR_Handles[symIdx][i] == INVALID_HANDLE)
            {
               Print("WARNING: Failed to create indicators for ", g_MultiSymbols[symIdx]);
            }

            // Initialize timeframe analysis
            g_MultiTFAnalysis[symIdx][i].timeframe = g_Timeframes[i];
            g_MultiTFAnalysis[symIdx][i].tfName = GetTimeframeName(g_Timeframes[i]);
            g_MultiTFAnalysis[symIdx][i].bias = 0;
            g_MultiTFAnalysis[symIdx][i].confidence = 0;
         }

         // Initialize signal tracking
         g_MultiSignalHistoryCount[symIdx] = 0;
         g_MultiSignalActive[symIdx] = false;
         g_MultiLastSignalTime[symIdx] = 0;
      }

      Print(">>> Multi-Symbol Mode ENABLED with ", g_MultiSymbolCount, " symbols");
   }

   // Create dashboard AFTER multi-symbol mode is initialized
   if(ShowDashboard)
   {
      CreateDashboard();

      if(g_MultiSymbolMode)
      {
         CreateMultiSymbolDashboards();
      }

      // Perform initial analysis immediately
      if(!g_MultiSymbolMode)
      {
         PerformMultiTimeframeAnalysis();
         UpdateDashboard();
      }
      else
      {
         PerformMultiSymbolAnalysis();
         UpdateMultiSymbolDashboards();
      }
   }

   Print(">>> Symbol Master Pro initialized for ", g_Symbol, " with ", g_ActiveTFCount, " timeframes");
   Print(">>> Signal History System: ENABLED (Max ", MAX_SIGNAL_HISTORY, " signals)");

   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                        |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   // Delete all chart objects
   DeleteDashboard();
   DeleteAllChartObjects();
   
   // Release indicator handles
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      if(g_TrendMA_Handles[i] != INVALID_HANDLE)
         IndicatorRelease(g_TrendMA_Handles[i]);
      if(g_ATR_Handles[i] != INVALID_HANDLE)
         IndicatorRelease(g_ATR_Handles[i]);
   }
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                               |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   // Only analyze on new bar
   datetime currentBarTime = iTime(g_Symbol, PERIOD_CURRENT, 0);

   if(currentBarTime != g_LastAnalysisTime)
   {
      g_LastAnalysisTime = currentBarTime;

      if(g_MultiSymbolMode)
      {
         // MULTI-SYMBOL MODE: Analyze all 10 symbols
         PerformMultiSymbolAnalysis();

         // Update multi-symbol dashboards
         if(ShowDashboard)
         {
            UpdateMultiSymbolDashboards();
         }

         // Generate signals for all symbols
         if(GenerateSignals)
         {
            GenerateMultiSymbolSignals();
         }
      }
      else
      {
         // SINGLE-SYMBOL MODE: Original behavior
         PerformMultiTimeframeAnalysis();

         // Update dashboard
         if(ShowDashboard)
         {
            UpdateDashboard();
         }

         // Generate signals
         if(GenerateSignals)
         {
            GenerateConfluenceSignal();
         }

         // Draw objects on chart
         DrawChartObjects();
      }
   }

   return(rates_total);
}

//+------------------------------------------------------------------+
//| Chart Event Handler                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
   // Handle object click events
   if(id == CHARTEVENT_OBJECT_CLICK)
   {
      // Check if toggle button clicked
      if(sparam == "SymMaster_ToggleBtn")
      {
         g_DashboardExpanded = !g_DashboardExpanded;
         UpdateDashboardVisibility();
         return;
      }
      
      // Check if timeframe button clicked
      if(StringFind(sparam, "SymMaster_TFBtn_") >= 0)
      {
         // Extract timeframe index
         string indexStr = StringSubstr(sparam, 16);
         int tfIndex = (int)StringToInteger(indexStr);
         
         if(tfIndex >= 0 && tfIndex < g_ActiveTFCount)
         {
            // Toggle mini chart
            if(g_ActiveMiniChart == tfIndex)
            {
               // Close currently open mini chart
               CloseMiniChart();
            }
            else
            {
               // Close any open mini chart and open new one
               if(g_ActiveMiniChart >= 0)
                  CloseMiniChart();
               
               g_ActiveMiniChart = tfIndex;
               CreateMiniChart(tfIndex);
            }
         }
         return;
      }
      
      // Check if mini chart close button clicked
      if(sparam == "SymMaster_MiniClose")
      {
         CloseMiniChart();
         return;
      }
      
      // Style button clicks
      if(sparam == "SymMaster_StyleA")
      {
         // Update button visual states
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BGCOLOR, clrDarkGreen);
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BORDER_COLOR, clrLime);
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BORDER_COLOR, clrGray);
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BORDER_COLOR, clrGray);

         // Update active style
         g_ActiveSignalStyle = STYLE_BOX_PANEL;

         // Redraw ALL historical signals in new style
         RedrawAllSignals();

         // Update signal panel
         UpdateSignalPanel();
         ChartRedraw();

         Print("Signal display style changed to: BOX PANEL (showing ", g_SignalHistoryCount, " signals)");
         return;
      }

      if(sparam == "SymMaster_StyleB")
      {
         // Update button visual states
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BORDER_COLOR, clrGray);
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BGCOLOR, clrDarkGreen);
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BORDER_COLOR, clrLime);
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BORDER_COLOR, clrGray);

         // Update active style
         g_ActiveSignalStyle = STYLE_VERTICAL_ZONE;

         // Redraw ALL historical signals in new style
         RedrawAllSignals();

         // Update signal panel
         UpdateSignalPanel();
         ChartRedraw();

         Print("Signal display style changed to: VERTICAL ZONE (showing ", g_SignalHistoryCount, " signals)");
         return;
      }

      if(sparam == "SymMaster_StyleC")
      {
         // Update button visual states
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BORDER_COLOR, clrGray);
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BORDER_COLOR, clrGray);
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BGCOLOR, clrDarkGreen);
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BORDER_COLOR, clrLime);

         // Update active style
         g_ActiveSignalStyle = STYLE_ADVANCED_LABEL;

         // Redraw ALL historical signals in new style
         RedrawAllSignals();

         // Update signal panel
         UpdateSignalPanel();
         ChartRedraw();

         Print("Signal display style changed to: ADVANCED LABEL (showing ", g_SignalHistoryCount, " signals)");
         return;
      }

      // Mode Toggle Button Click (accept clicks on both background and label)
      if(sparam == "SymMaster_ModeToggle" || sparam == "SymMaster_ModeToggleBG")
      {
         // Toggle the mode
         g_MultiSymbolMode = !g_MultiSymbolMode;

         Print(">>> Switching to ", g_MultiSymbolMode ? "MULTI-SYMBOL" : "SINGLE-SYMBOL", " mode");

         // Delete ALL dashboard objects
         DeleteDashboard();

         // Recreate dashboard in new mode
         if(g_MultiSymbolMode)
         {
            CreateDashboard();  // Create base dashboard first
            CreateMultiSymbolDashboards();  // Then add multi-symbol boxes

            // Perform analysis and update immediately
            PerformMultiSymbolAnalysis();
            UpdateMultiSymbolDashboards();
         }
         else
         {
            CreateDashboard();  // Single symbol dashboard

            // Perform analysis and update immediately
            PerformMultiTimeframeAnalysis();
            UpdateDashboard();
         }

         // Update the toggle button text
         ObjectSetString(0, "SymMaster_ModeToggle", OBJPROP_TEXT, g_MultiSymbolMode ? "🔄 SINGLE" : "🔄 MULTI");

         ChartRedraw();
         return;
      }
   }
}

//+------------------------------------------------------------------+
//| Perform Multi-Timeframe Analysis                                 |
//+------------------------------------------------------------------+
void PerformMultiTimeframeAnalysis()
{
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      AnalyzeTimeframe(g_TFAnalysis[i]);
   }
}

//+------------------------------------------------------------------+
//| Perform Multi-Symbol Analysis (all 10 symbols)                   |
//+------------------------------------------------------------------+
void PerformMultiSymbolAnalysis()
{
   for(int symIdx = 0; symIdx < g_MultiSymbolCount; symIdx++)
   {
      string symbol = g_MultiSymbols[symIdx];

      // Analyze all timeframes for this symbol
      for(int tfIdx = 0; tfIdx < g_ActiveTFCount; tfIdx++)
      {
         AnalyzeTimeframeForSymbol(g_MultiTFAnalysis[symIdx][tfIdx], symbol);
      }
   }
}

//+------------------------------------------------------------------+
//| Generate Signals for All Symbols                                 |
//+------------------------------------------------------------------+
void GenerateMultiSymbolSignals()
{
   for(int symIdx = 0; symIdx < g_MultiSymbolCount; symIdx++)
   {
      string symbol = g_MultiSymbols[symIdx];

      // Count bullish and bearish timeframes for this symbol
      int bullishTFs = 0;
      int bearishTFs = 0;
      int weightedBullScore = 0;
      int weightedBearScore = 0;
      string confirmingTFs = "";

      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         int weight = 1;

         // Assign weight based on timeframe
         if(g_MultiTFAnalysis[symIdx][i].timeframe == PERIOD_D1) weight = 10;
         else if(g_MultiTFAnalysis[symIdx][i].timeframe == PERIOD_H4) weight = 8;
         else if(g_MultiTFAnalysis[symIdx][i].timeframe == PERIOD_H1) weight = 6;
         else if(g_MultiTFAnalysis[symIdx][i].timeframe == PERIOD_M30) weight = 4;
         else if(g_MultiTFAnalysis[symIdx][i].timeframe == PERIOD_M15) weight = 3;
         else if(g_MultiTFAnalysis[symIdx][i].timeframe == PERIOD_M5) weight = 2;

         if(g_MultiTFAnalysis[symIdx][i].bias == 1)
         {
            bullishTFs++;
            weightedBullScore += weight;
            confirmingTFs += g_MultiTFAnalysis[symIdx][i].tfName + ",";
         }
         else if(g_MultiTFAnalysis[symIdx][i].bias == -1)
         {
            bearishTFs++;
            weightedBearScore += weight;
            confirmingTFs += g_MultiTFAnalysis[symIdx][i].tfName + ",";
         }
      }

      // Remove trailing comma
      if(StringLen(confirmingTFs) > 0)
         confirmingTFs = StringSubstr(confirmingTFs, 0, StringLen(confirmingTFs) - 1);

      // Check for signal conditions
      bool signalFound = false;
      bool isBuySignal = false;
      int confluenceScore = 0;
      int weightedScore = 0;

      if(bullishTFs >= MinConfirmingTimeframes)
      {
         signalFound = true;
         isBuySignal = true;
         confluenceScore = (int)MathMin((double)bullishTFs / (double)g_ActiveTFCount * 10.0, 10.0);
         weightedScore = weightedBullScore;
      }
      else if(bearishTFs >= MinConfirmingTimeframes)
      {
         signalFound = true;
         isBuySignal = false;
         confluenceScore = (int)MathMin((double)bearishTFs / (double)g_ActiveTFCount * 10.0, 10.0);
         weightedScore = weightedBearScore;
      }

      // Generate signal if conditions met
      if(signalFound && confluenceScore >= MinConfluenceScore)
      {
         double currentPrice = SymbolInfoDouble(symbol, SYMBOL_BID);
         double point = SymbolInfoDouble(symbol, SYMBOL_POINT);

         g_MultiCurrentSignal[symIdx].time = TimeCurrent();
         g_MultiCurrentSignal[symIdx].isBuy = isBuySignal;
         g_MultiCurrentSignal[symIdx].entryPrice = currentPrice;
         g_MultiCurrentSignal[symIdx].confluenceScore = confluenceScore;
         g_MultiCurrentSignal[symIdx].confirmingTFs = confirmingTFs;
         g_MultiCurrentSignal[symIdx].tfWeight = weightedScore;

         // Determine perspective
         if(weightedScore >= 18)
         {
            g_MultiCurrentSignal[symIdx].perspective = PERSPECTIVE_SWING;
            g_MultiCurrentSignal[symIdx].perspectiveText = "SWING";
            g_MultiCurrentSignal[symIdx].holdTime = "2-5 days";
         }
         else if(weightedScore >= 10)
         {
            g_MultiCurrentSignal[symIdx].perspective = PERSPECTIVE_INTRADAY;
            g_MultiCurrentSignal[symIdx].perspectiveText = "INTRADAY";
            g_MultiCurrentSignal[symIdx].holdTime = "1-4 hours";
         }
         else
         {
            g_MultiCurrentSignal[symIdx].perspective = PERSPECTIVE_SCALP;
            g_MultiCurrentSignal[symIdx].perspectiveText = "SCALP";
            g_MultiCurrentSignal[symIdx].holdTime = "5-15 mins";
         }

         // Calculate SL/TP
         if(isBuySignal)
         {
            g_MultiCurrentSignal[symIdx].stopLoss = currentPrice - (StopLossPips * point * 10);
            g_MultiCurrentSignal[symIdx].takeProfit = currentPrice + (StopLossPips * MinRiskReward * point * 10);
         }
         else
         {
            g_MultiCurrentSignal[symIdx].stopLoss = currentPrice + (StopLossPips * point * 10);
            g_MultiCurrentSignal[symIdx].takeProfit = currentPrice - (StopLossPips * MinRiskReward * point * 10);
         }

         g_MultiCurrentSignal[symIdx].riskReward = MinRiskReward;
         g_MultiSignalActive[symIdx] = true;

         // Alert if new signal
         if(EnableAlerts && g_MultiLastSignalTime[symIdx] != g_MultiCurrentSignal[symIdx].time)
         {
            g_MultiLastSignalTime[symIdx] = g_MultiCurrentSignal[symIdx].time;

            string alertMsg = StringFormat("🚨 %s %s %s [%d/10]",
                                          symbol,
                                          g_MultiCurrentSignal[symIdx].perspectiveText,
                                          isBuySignal ? "BUY" : "SELL",
                                          confluenceScore);

            Alert(alertMsg);

            if(EnableSoundAlerts)
            {
               string soundFile = "alert.wav";
               if(g_MultiCurrentSignal[symIdx].perspective == PERSPECTIVE_SWING)
                  soundFile = "alert2.wav";
               else if(g_MultiCurrentSignal[symIdx].perspective == PERSPECTIVE_SCALP)
                  soundFile = "tick.wav";

               PlaySound(soundFile);
            }

            if(EnablePushNotifications)
               SendNotification(alertMsg);
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Analyze Single Timeframe                                         |
//+------------------------------------------------------------------+
void AnalyzeTimeframe(TimeframeAnalysis &tf)
{
   // Get price data
   double close[], high[], low[], open[];
   ArraySetAsSeries(close, true);
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   ArraySetAsSeries(open, true);
   
   int copied = CopyClose(g_Symbol, tf.timeframe, 0, 100, close);
   if(copied <= 0) return;
   
   CopyHigh(g_Symbol, tf.timeframe, 0, 100, high);
   CopyLow(g_Symbol, tf.timeframe, 0, 100, low);
   CopyOpen(g_Symbol, tf.timeframe, 0, 100, open);
   
   // Analyze Trend
   AnalyzeTrend(tf, close);
   
   // Find Swing Points
   FindSwingPoints(tf, high, low);
   
   // Detect Order Blocks
   DetectOrderBlocks(tf, open, high, low, close);
   
   // Detect Fair Value Gaps
   DetectFairValueGaps(tf, high, low);
   
   // Identify Liquidity Zones
   IdentifyLiquidityZones(tf, high, low);
   
   // Calculate Overall Bias
   CalculateOverallBias(tf);
}

//+------------------------------------------------------------------+
//| Analyze Timeframe For Specific Symbol                            |
//+------------------------------------------------------------------+
void AnalyzeTimeframeForSymbol(TimeframeAnalysis &tf, string symbol)
{
   // Get price data for specified symbol
   double close[], high[], low[], open[];
   ArraySetAsSeries(close, true);
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   ArraySetAsSeries(open, true);

   int copied = CopyClose(symbol, tf.timeframe, 0, 100, close);
   if(copied <= 0) return;

   CopyHigh(symbol, tf.timeframe, 0, 100, high);
   CopyLow(symbol, tf.timeframe, 0, 100, low);
   CopyOpen(symbol, tf.timeframe, 0, 100, open);

   // Analyze Trend
   AnalyzeTrend(tf, close);

   // Find Swing Points
   FindSwingPoints(tf, high, low);

   // Detect Order Blocks
   DetectOrderBlocks(tf, open, high, low, close);

   // Detect Fair Value Gaps
   DetectFairValueGaps(tf, high, low);

   // Identify Liquidity Zones
   IdentifyLiquidityZones(tf, high, low);

   // Calculate Overall Bias
   CalculateOverallBias(tf);
}

//+------------------------------------------------------------------+
//| Analyze Trend                                                    |
//+------------------------------------------------------------------+
void AnalyzeTrend(TimeframeAnalysis &tf, const double &close[])
{
   double ma[];
   ArraySetAsSeries(ma, true);
   
   int maIndex = -1;
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      if(g_TFAnalysis[i].timeframe == tf.timeframe)
      {
         maIndex = i;
         break;
      }
   }
   
   if(maIndex < 0) return;
   
   if(CopyBuffer(g_TrendMA_Handles[maIndex], 0, 0, 50, ma) <= 0)
      return;
   
   double currentPrice = close[0];
   double maValue = ma[0];
   
   // Determine trend
   if(currentPrice > maValue)
   {
      tf.isBullish = true;
      tf.isBearish = false;
      
      // Calculate strength
      double distance = (currentPrice - maValue) / maValue;
      tf.trendStrength = MathMin(distance * 100, 1.0);
   }
   else
   {
      tf.isBullish = false;
      tf.isBearish = true;
      
      double distance = (maValue - currentPrice) / maValue;
      tf.trendStrength = MathMin(distance * 100, 1.0);
   }
}

//+------------------------------------------------------------------+
//| Find Swing Points                                                |
//+------------------------------------------------------------------+
void FindSwingPoints(TimeframeAnalysis &tf, const double &high[], const double &low[])
{
   int lookback = SwingLookback;
   
   // Find swing high
   double swingHigh = high[0];
   for(int i = 1; i <= lookback; i++)
   {
      if(high[i] > swingHigh)
         swingHigh = high[i];
   }
   tf.lastSwingHigh = swingHigh;
   
   // Find swing low
   double swingLow = low[0];
   for(int i = 1; i <= lookback; i++)
   {
      if(low[i] < swingLow)
         swingLow = low[i];
   }
   tf.lastSwingLow = swingLow;
   
   // Check for BOS (Break of Structure)
   if(high[0] > tf.lastSwingHigh)
      tf.bosOccurred = true;
   else
      tf.bosOccurred = false;
   
   // Check for CHoCH (Change of Character)
   if(low[0] < tf.lastSwingLow)
      tf.chochOccurred = true;
   else
      tf.chochOccurred = false;
}

//+------------------------------------------------------------------+
//| Detect Order Blocks                                              |
//+------------------------------------------------------------------+
void DetectOrderBlocks(TimeframeAnalysis &tf, const double &open[], 
                       const double &high[], const double &low[], 
                       const double &close[])
{
   tf.bullishOBCount = 0;
   tf.bearishOBCount = 0;
   tf.strongestBullOB = 0;
   tf.strongestBearOB = 0;
   
   for(int i = 1; i < OrderBlockLookback; i++)
   {
      // Bullish Order Block detection
      if(close[i] < open[i]) // Bearish candle
      {
         if(close[i+1] > open[i+1]) // Followed by bullish candle
         {
            double obStrength = (high[i+1] - low[i]) / low[i];
            
            if(obStrength >= MinOrderBlockStrength)
            {
               tf.bullishOBCount++;
               if(obStrength > tf.strongestBullOB)
                  tf.strongestBullOB = low[i];
            }
         }
      }
      
      // Bearish Order Block detection
      if(close[i] > open[i]) // Bullish candle
      {
         if(close[i+1] < open[i+1]) // Followed by bearish candle
         {
            double obStrength = (high[i] - low[i+1]) / high[i];
            
            if(obStrength >= MinOrderBlockStrength)
            {
               tf.bearishOBCount++;
               if(obStrength > tf.strongestBearOB || tf.strongestBearOB == 0)
                  tf.strongestBearOB = high[i];
            }
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Detect Fair Value Gaps                                          |
//+------------------------------------------------------------------+
void DetectFairValueGaps(TimeframeAnalysis &tf, const double &high[], const double &low[])
{
   tf.bullishFVGCount = 0;
   tf.bearishFVGCount = 0;
   tf.nearestBullFVG = 0;
   tf.nearestBearFVG = 0;
   
   double point = SymbolInfoDouble(g_Symbol, SYMBOL_POINT);
   double minGapSize = FVGMinSizePips * point * 10;
   
   for(int i = 1; i < 50; i++)
   {
      // Bullish FVG: low[i-1] > high[i+1]
      if(low[i-1] > high[i+1])
      {
         double gapSize = low[i-1] - high[i+1];
         if(gapSize >= minGapSize)
         {
            tf.bullishFVGCount++;
            if(tf.nearestBullFVG == 0)
               tf.nearestBullFVG = high[i+1];
         }
      }
      
      // Bearish FVG: high[i-1] < low[i+1]
      if(high[i-1] < low[i+1])
      {
         double gapSize = low[i+1] - high[i-1];
         if(gapSize >= minGapSize)
         {
            tf.bearishFVGCount++;
            if(tf.nearestBearFVG == 0)
               tf.nearestBearFVG = low[i+1];
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Identify Liquidity Zones                                         |
//+------------------------------------------------------------------+
void IdentifyLiquidityZones(TimeframeAnalysis &tf, const double &high[], const double &low[])
{
   // Find recent highs and lows as liquidity zones
   double recentHigh = high[0];
   double recentLow = low[0];
   
   for(int i = 1; i < 20; i++)
   {
      if(high[i] > recentHigh)
         recentHigh = high[i];
      if(low[i] < recentLow)
         recentLow = low[i];
   }
   
   tf.buyLiquidity = recentLow;
   tf.sellLiquidity = recentHigh;
}

//+------------------------------------------------------------------+
//| Calculate Overall Bias                                           |
//+------------------------------------------------------------------+
void CalculateOverallBias(TimeframeAnalysis &tf)
{
   int bullishSignals = 0;
   int bearishSignals = 0;
   
   // Trend
   if(tf.isBullish) bullishSignals++;
   if(tf.isBearish) bearishSignals++;
   
   // Order Blocks
   if(tf.bullishOBCount > tf.bearishOBCount) bullishSignals++;
   if(tf.bearishOBCount > tf.bullishOBCount) bearishSignals++;
   
   // Fair Value Gaps
   if(tf.bullishFVGCount > tf.bearishFVGCount) bullishSignals++;
   if(tf.bearishFVGCount > tf.bullishFVGCount) bearishSignals++;
   
   // Structure
   if(tf.bosOccurred && tf.isBullish) bullishSignals++;
   if(tf.chochOccurred && tf.isBearish) bearishSignals++;
   
   // Determine bias
   if(bullishSignals > bearishSignals)
   {
      tf.bias = 1;
      tf.confidence = (int)MathMin((double)bullishSignals / 7.0 * 10.0, 10.0);
   }
   else if(bearishSignals > bullishSignals)
   {
      tf.bias = -1;
      tf.confidence = (int)MathMin((double)bearishSignals / 7.0 * 10.0, 10.0);
   }
   else
   {
      tf.bias = 0;
      tf.confidence = 5;
   }
}

//+------------------------------------------------------------------+
//| Generate Confluence Signal with Perspective & Edge Filters      |
//+------------------------------------------------------------------+
void GenerateConfluenceSignal()
{
   int bullishTFs = 0;
   int bearishTFs = 0;
   string confirmingTFs = "";
   int weightedBullScore = 0;
   int weightedBearScore = 0;
   
   // TF Weight System: Higher TFs = More Weight
   int tfWeights[7];
   tfWeights[0] = 1;  // M1
   tfWeights[1] = 2;  // M5
   tfWeights[2] = 3;  // M15
   tfWeights[3] = 4;  // M30
   tfWeights[4] = 6;  // H1
   tfWeights[5] = 8;  // H4
   tfWeights[6] = 10; // D1
   
   // Count bias across timeframes with weighting
   string scalpTFs = "";
   string intradayTFs = "";
   string swingTFs = "";
   
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      int weight = 1;
      
      // Assign weight based on timeframe
      if(g_TFAnalysis[i].timeframe == PERIOD_D1) weight = 10;
      else if(g_TFAnalysis[i].timeframe == PERIOD_H4) weight = 8;
      else if(g_TFAnalysis[i].timeframe == PERIOD_H1) weight = 6;
      else if(g_TFAnalysis[i].timeframe == PERIOD_M30) weight = 4;
      else if(g_TFAnalysis[i].timeframe == PERIOD_M15) weight = 3;
      else if(g_TFAnalysis[i].timeframe == PERIOD_M5) weight = 2;
      else weight = 1;
      
      if(g_TFAnalysis[i].bias == 1)
      {
         bullishTFs++;
         weightedBullScore += weight;
         confirmingTFs += g_TFAnalysis[i].tfName + ",";
         
         // Categorize by TF for perspective
         if(g_TFAnalysis[i].timeframe <= PERIOD_M15)
            scalpTFs += g_TFAnalysis[i].tfName + ",";
         if(g_TFAnalysis[i].timeframe >= PERIOD_M15 && g_TFAnalysis[i].timeframe <= PERIOD_H1)
            intradayTFs += g_TFAnalysis[i].tfName + ",";
         if(g_TFAnalysis[i].timeframe >= PERIOD_H1)
            swingTFs += g_TFAnalysis[i].tfName + ",";
      }
      else if(g_TFAnalysis[i].bias == -1)
      {
         bearishTFs++;
         weightedBearScore += weight;
         confirmingTFs += g_TFAnalysis[i].tfName + ",";
         
         // Categorize by TF for perspective
         if(g_TFAnalysis[i].timeframe <= PERIOD_M15)
            scalpTFs += g_TFAnalysis[i].tfName + ",";
         if(g_TFAnalysis[i].timeframe >= PERIOD_M15 && g_TFAnalysis[i].timeframe <= PERIOD_H1)
            intradayTFs += g_TFAnalysis[i].tfName + ",";
         if(g_TFAnalysis[i].timeframe >= PERIOD_H1)
            swingTFs += g_TFAnalysis[i].tfName + ",";
      }
   }
   
   // Remove trailing commas
   if(StringLen(confirmingTFs) > 0)
      confirmingTFs = StringSubstr(confirmingTFs, 0, StringLen(confirmingTFs) - 1);
   if(StringLen(scalpTFs) > 0)
      scalpTFs = StringSubstr(scalpTFs, 0, StringLen(scalpTFs) - 1);
   if(StringLen(intradayTFs) > 0)
      intradayTFs = StringSubstr(intradayTFs, 0, StringLen(intradayTFs) - 1);
   if(StringLen(swingTFs) > 0)
      swingTFs = StringSubstr(swingTFs, 0, StringLen(swingTFs) - 1);
   
   // Check for signal conditions
   bool signalFound = false;
   bool isBuySignal = false;
   int confluenceScore = 0;
   int weightedScore = 0;
   
   if(bullishTFs >= MinConfirmingTimeframes)
   {
      signalFound = true;
      isBuySignal = true;
      confluenceScore = (int)MathMin((double)bullishTFs / (double)g_ActiveTFCount * 10.0, 10.0);
      weightedScore = weightedBullScore;
   }
   else if(bearishTFs >= MinConfirmingTimeframes)
   {
      signalFound = true;
      isBuySignal = false;
      confluenceScore = (int)MathMin((double)bearishTFs / (double)g_ActiveTFCount * 10.0, 10.0);
      weightedScore = weightedBearScore;
   }
   
   // Generate signal if conditions met
   if(signalFound && confluenceScore >= MinConfluenceScore)
   {
      double currentPrice = SymbolInfoDouble(g_Symbol, SYMBOL_BID);
      double point = SymbolInfoDouble(g_Symbol, SYMBOL_POINT);
      
      g_CurrentSignal.time = TimeCurrent();
      g_CurrentSignal.isBuy = isBuySignal;
      g_CurrentSignal.entryPrice = currentPrice;
      g_CurrentSignal.confluenceScore = confluenceScore;
      g_CurrentSignal.confirmingTFs = confirmingTFs;
      g_CurrentSignal.tfWeight = weightedScore;
      
      // Determine Signal Perspective
      if(StringLen(swingTFs) > 0 && weightedScore >= 18)
      {
         g_CurrentSignal.perspective = PERSPECTIVE_SWING;
         g_CurrentSignal.perspectiveText = "SWING";
         g_CurrentSignal.holdTime = "2-5 days";
      }
      else if(StringLen(intradayTFs) > 0 && weightedScore >= 10)
      {
         g_CurrentSignal.perspective = PERSPECTIVE_INTRADAY;
         g_CurrentSignal.perspectiveText = "INTRADAY";
         g_CurrentSignal.holdTime = "1-4 hours";
      }
      else
      {
         g_CurrentSignal.perspective = PERSPECTIVE_SCALP;
         g_CurrentSignal.perspectiveText = "SCALP";
         g_CurrentSignal.holdTime = "5-15 mins";
      }
      
      // Apply Edge Filters
      g_CurrentSignal.passedFilters = ApplyEdgeFilters(isBuySignal, weightedScore);
      
      // Only proceed if passed filters
      if(!g_CurrentSignal.passedFilters)
      {
         g_SignalActive = false;
         return;
      }
      
      // Calculate stop loss and take profit
      if(isBuySignal)
      {
         g_CurrentSignal.stopLoss = currentPrice - (StopLossPips * point * 10);
         g_CurrentSignal.takeProfit = currentPrice + (StopLossPips * MinRiskReward * point * 10);
      }
      else
      {
         g_CurrentSignal.stopLoss = currentPrice + (StopLossPips * point * 10);
         g_CurrentSignal.takeProfit = currentPrice - (StopLossPips * MinRiskReward * point * 10);
      }
      
      g_CurrentSignal.riskReward = MinRiskReward;
      g_CurrentSignal.setupDescription = "Multi-TF " + g_CurrentSignal.perspectiveText + " Setup";
      
      g_SignalActive = true;

      // ADD SIGNAL TO HISTORY - This ensures we don't lose signals!
      AddSignalToHistory(g_CurrentSignal);

      // Alert if enabled
      if(EnableAlerts && g_LastSignalTime != g_CurrentSignal.time)
      {
         g_LastSignalTime = g_CurrentSignal.time;

         // Format timestamp for display
         string timeStr = TimeToString(g_CurrentSignal.time, TIME_DATE|TIME_MINUTES);

         string alertMsg = StringFormat("🚨 %s %s SIGNAL [%d/10]\n📅 Time: %s\n📊 Symbol: %s\n⏰ Hold: %s\n💰 RR: %.1f:1\n📈 TFs: %s",
                                       g_CurrentSignal.perspectiveText,
                                       isBuySignal ? "BUY" : "SELL",
                                       confluenceScore,
                                       timeStr,
                                       g_Symbol,
                                       g_CurrentSignal.holdTime,
                                       MinRiskReward,
                                       confirmingTFs);

         Alert(alertMsg);

         // Play custom sound based on perspective
         if(EnableSoundAlerts)
         {
            string soundFile = "alert.wav";  // Default
            if(g_CurrentSignal.perspective == PERSPECTIVE_SWING)
               soundFile = "alert2.wav";  // Higher pitch for swing
            else if(g_CurrentSignal.perspective == PERSPECTIVE_INTRADAY)
               soundFile = "alert.wav";  // Medium for intraday
            else
               soundFile = "tick.wav";  // Quick tick for scalp

            PlaySound(soundFile);
         }

         if(EnablePushNotifications)
            SendNotification(alertMsg);

         Print(">>> NEW SIGNAL GENERATED: ", g_CurrentSignal.perspectiveText, " ",
               isBuySignal ? "BUY" : "SELL", " at ", timeStr);
      }

      // Draw signal on chart based on selected style
      if(DrawSignalsOnChart)
      {
         DeleteOldSignals();  // Clean up signals NOT in history

         switch(g_ActiveSignalStyle)
         {
            case STYLE_BOX_PANEL:
               DrawSignalBoxPanel();
               break;
            case STYLE_VERTICAL_ZONE:
               DrawVerticalZoneMarker();
               break;
            case STYLE_ADVANCED_LABEL:
               DrawAdvancedLabel();
               break;
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Draw Signal Arrow                                                |
//+------------------------------------------------------------------+
void DrawSignalArrow()
{
   string arrowName = "SymMaster_Signal_" + TimeToString(g_CurrentSignal.time);
   
   if(ObjectFind(0, arrowName) < 0)
   {
      ObjectCreate(0, arrowName, OBJ_ARROW, 0, 
                   g_CurrentSignal.time, g_CurrentSignal.entryPrice);
      
      if(g_CurrentSignal.isBuy)
      {
         ObjectSetInteger(0, arrowName, OBJPROP_ARROWCODE, 233); // Up arrow
         ObjectSetInteger(0, arrowName, OBJPROP_COLOR, clrLime);
      }
      else
      {
         ObjectSetInteger(0, arrowName, OBJPROP_ARROWCODE, 234); // Down arrow
         ObjectSetInteger(0, arrowName, OBJPROP_COLOR, clrRed);
      }
      
      ObjectSetInteger(0, arrowName, OBJPROP_WIDTH, 3);
      ObjectSetString(0, arrowName, OBJPROP_TEXT, 
                      StringFormat("%s [%d] RR:%.1f", 
                                  g_CurrentSignal.isBuy ? "BUY" : "SELL",
                                  g_CurrentSignal.confluenceScore,
                                  g_CurrentSignal.riskReward));
   }
}

//+------------------------------------------------------------------+
//| Apply Edge Filters                                               |
//+------------------------------------------------------------------+
bool ApplyEdgeFilters(bool isBuy, int weightedScore)
{
   // Filter 1: Higher Timeframe Bias Filter
   if(UseHTFBiasFilter)
   {
      // Find H4 and D1 bias
      int h4Bias = 0, d1Bias = 0;
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         if(g_TFAnalysis[i].timeframe == PERIOD_H4)
            h4Bias = g_TFAnalysis[i].bias;
         if(g_TFAnalysis[i].timeframe == PERIOD_D1)
            d1Bias = g_TFAnalysis[i].bias;
      }
      
      // Signal must align with HTF bias
      int requiredBias = isBuy ? 1 : -1;
      if(d1Bias != 0 && d1Bias != requiredBias)
         return false;  // D1 against us
      if(h4Bias != 0 && h4Bias != requiredBias)
         return false;  // H4 against us
   }
   
   // Filter 2: Volatility Filter using ATR
   if(UseVolatilityFilter && g_ActiveTFCount > 0)
   {
      double atr[];
      ArraySetAsSeries(atr, true);
      
      // Use H1 ATR as reference
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         if(g_TFAnalysis[i].timeframe == PERIOD_H1 || i == g_ActiveTFCount - 1)
         {
            int atrHandle = g_ATR_Handles[i];
            if(CopyBuffer(atrHandle, 0, 0, 20, atr) > 0)
            {
               double currentATR = atr[0];
               double avgATR = 0;
               for(int j = 0; j < 20 && j < ArraySize(atr); j++)
                  avgATR += atr[j];
               avgATR /= MathMin(20, ArraySize(atr));
               
               double atrRatio = currentATR / avgATR;
               
               // Filter out too quiet or too choppy markets
               if(atrRatio < MinATRMultiplier || atrRatio > MaxATRMultiplier)
                  return false;
            }
            break;
         }
      }
   }
   
   // Filter 3: Session Filter
   if(UseSessionFilter)
   {
      MqlDateTime dt;
      TimeCurrent(dt);
      int hour = dt.hour;
      
      // Best sessions: London (8-12 GMT) and NY (13-17 GMT)
      // Avoid Asian session and dead hours
      if(hour < 7 || hour > 18 || (hour >= 12 && hour <= 13))
         return false;
   }
   
   // Filter 4: Liquidity Sweep Confirmation
   if(UseLiquiditySweepConfirm)
   {
      // Check if price recently swept liquidity
      double high[], low[];
      ArraySetAsSeries(high, true);
      ArraySetAsSeries(low, true);
      
      CopyHigh(g_Symbol, PERIOD_H1, 0, 10, high);
      CopyLow(g_Symbol, PERIOD_H1, 0, 10, low);
      
      if(ArraySize(high) > 5)
      {
         double recentHigh = high[1];
         double recentLow = low[1];
         
         for(int i = 2; i < 10; i++)
         {
            if(high[i] > recentHigh) recentHigh = high[i];
            if(low[i] < recentLow) recentLow = low[i];
         }
         
         // For buy: should have swept lows recently
         // For sell: should have swept highs recently
         bool sweptLiquidity = false;
         if(isBuy && low[0] <= recentLow) sweptLiquidity = true;
         if(!isBuy && high[0] >= recentHigh) sweptLiquidity = true;
         
         if(!sweptLiquidity)
            return false;  // No liquidity sweep detected
      }
   }
   
   return true;  // Passed all filters
}

//+------------------------------------------------------------------+
//| Add Signal to History                                            |
//+------------------------------------------------------------------+
void AddSignalToHistory(ConfluenceSignal &signal)
{
   // Check if signal already exists in history (prevent duplicates)
   for(int i = 0; i < g_SignalHistoryCount; i++)
   {
      if(g_SignalHistory[i].time == signal.time)
      {
         // Signal already exists, update it
         g_SignalHistory[i] = signal;
         return;
      }
   }

   // Add new signal to history
   if(g_SignalHistoryCount < MAX_SIGNAL_HISTORY)
   {
      g_SignalHistory[g_SignalHistoryCount] = signal;
      g_SignalHistoryCount++;
   }
   else
   {
      // History is full, shift array and add new signal
      for(int i = 0; i < MAX_SIGNAL_HISTORY - 1; i++)
      {
         g_SignalHistory[i] = g_SignalHistory[i + 1];
      }
      g_SignalHistory[MAX_SIGNAL_HISTORY - 1] = signal;
   }

   Print(">>> Signal added to history. Total signals in history: ", g_SignalHistoryCount);
}

//+------------------------------------------------------------------+
//| Delete Signals Older Than History Limit                         |
//+------------------------------------------------------------------+
void DeleteOldSignals()
{
   // Build list of timestamps we want to keep
   datetime keepTimes[];
   ArrayResize(keepTimes, g_SignalHistoryCount);

   for(int i = 0; i < g_SignalHistoryCount; i++)
   {
      keepTimes[i] = g_SignalHistory[i].time;
   }

   // Delete signal objects that are NOT in our history
   for(int i = ObjectsTotal(0) - 1; i >= 0; i--)
   {
      string name = ObjectName(0, i);
      if(StringFind(name, "SymMaster_SignalBox") >= 0 ||
         StringFind(name, "SymMaster_SignalZone") >= 0 ||
         StringFind(name, "SymMaster_SignalLabel") >= 0 ||
         StringFind(name, "SymMaster_Signal_") >= 0)
      {
         // Extract timestamp from object name
         bool shouldKeep = false;
         for(int j = 0; j < g_SignalHistoryCount; j++)
         {
            string timeStr = TimeToString(keepTimes[j]);
            if(StringFind(name, timeStr) >= 0)
            {
               shouldKeep = true;
               break;
            }
         }

         if(!shouldKeep)
         {
            ObjectDelete(0, name);
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Redraw All Historical Signals                                    |
//+------------------------------------------------------------------+
void RedrawAllSignals()
{
   // Clear all signal objects first
   for(int i = ObjectsTotal(0) - 1; i >= 0; i--)
   {
      string name = ObjectName(0, i);
      if(StringFind(name, "SymMaster_SignalBox") >= 0 ||
         StringFind(name, "SymMaster_SignalZone") >= 0 ||
         StringFind(name, "SymMaster_SignalLabel") >= 0)
      {
         ObjectDelete(0, name);
      }
   }

   // Redraw all signals from history based on current style
   for(int i = 0; i < g_SignalHistoryCount; i++)
   {
      g_CurrentSignal = g_SignalHistory[i];

      switch(g_ActiveSignalStyle)
      {
         case STYLE_BOX_PANEL:
            DrawSignalBoxPanel();
            break;
         case STYLE_VERTICAL_ZONE:
            DrawVerticalZoneMarker();
            break;
         case STYLE_ADVANCED_LABEL:
            DrawAdvancedLabel();
            break;
      }
   }
}

//+------------------------------------------------------------------+
//| STYLE A: Draw Signal Box Panel                                  |
//+------------------------------------------------------------------+
void DrawSignalBoxPanel()
{
   string baseName = "SymMaster_SignalBox_" + TimeToString(g_CurrentSignal.time);

   // Get signal color based on perspective
   color signalColor = ScalpSignalColor;
   if(g_CurrentSignal.perspective == PERSPECTIVE_INTRADAY)
      signalColor = IntradaySignalColor;
   else if(g_CurrentSignal.perspective == PERSPECTIVE_SWING)
      signalColor = SwingSignalColor;

   // Box background
   double boxTop = g_CurrentSignal.entryPrice + (100 * _Point);
   double boxBottom = g_CurrentSignal.entryPrice - (100 * _Point);
   datetime boxStart = g_CurrentSignal.time;
   datetime boxEnd = g_CurrentSignal.time + PeriodSeconds(PERIOD_CURRENT) * 20;

   ObjectCreate(0, baseName + "_box", OBJ_RECTANGLE, 0, boxStart, boxTop, boxEnd, boxBottom);
   ObjectSetInteger(0, baseName + "_box", OBJPROP_COLOR, signalColor);
   ObjectSetInteger(0, baseName + "_box", OBJPROP_FILL, true);
   ObjectSetInteger(0, baseName + "_box", OBJPROP_BACK, true);
   ObjectSetInteger(0, baseName + "_box", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_box", OBJPROP_STYLE, STYLE_SOLID);

   // Signal text with timestamp
   string timeStr = ShowAlertTimestamp ? TimeToString(g_CurrentSignal.time, TIME_DATE|TIME_MINUTES) : "";
   string signalText = StringFormat("%s %s\n[%d] %s\n%s%sHold: %s\nRR: %.1f",
                                     g_CurrentSignal.perspectiveText,
                                     g_CurrentSignal.isBuy ? "BUY" : "SELL",
                                     g_CurrentSignal.confluenceScore,
                                     g_CurrentSignal.confirmingTFs,
                                     ShowAlertTimestamp ? "🕐 " : "",
                                     ShowAlertTimestamp ? timeStr + "\n" : "",
                                     g_CurrentSignal.holdTime,
                                     g_CurrentSignal.riskReward);

   ObjectCreate(0, baseName + "_text", OBJ_TEXT, 0, boxStart, g_CurrentSignal.entryPrice);
   ObjectSetString(0, baseName + "_text", OBJPROP_TEXT, signalText);
   ObjectSetInteger(0, baseName + "_text", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, baseName + "_text", OBJPROP_FONTSIZE, SignalFontSize);
   ObjectSetString(0, baseName + "_text", OBJPROP_FONT, "Arial Bold");

   // Entry line
   ObjectCreate(0, baseName + "_entry", OBJ_TREND, 0, boxStart, g_CurrentSignal.entryPrice,
                boxEnd, g_CurrentSignal.entryPrice);
   ObjectSetInteger(0, baseName + "_entry", OBJPROP_COLOR, clrYellow);
   ObjectSetInteger(0, baseName + "_entry", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_entry", OBJPROP_STYLE, STYLE_SOLID);
   ObjectSetInteger(0, baseName + "_entry", OBJPROP_RAY_RIGHT, true);
}

//+------------------------------------------------------------------+
//| STYLE B: Draw Vertical Zone Marker                              |
//+------------------------------------------------------------------+
void DrawVerticalZoneMarker()
{
   string baseName = "SymMaster_SignalZone_" + TimeToString(g_CurrentSignal.time);

   // Get signal color
   color signalColor = ScalpSignalColor;
   if(g_CurrentSignal.perspective == PERSPECTIVE_INTRADAY)
      signalColor = IntradaySignalColor;
   else if(g_CurrentSignal.perspective == PERSPECTIVE_SWING)
      signalColor = SwingSignalColor;

   // Vertical line at signal time
   ObjectCreate(0, baseName + "_vline", OBJ_VLINE, 0, g_CurrentSignal.time, 0);
   ObjectSetInteger(0, baseName + "_vline", OBJPROP_COLOR, signalColor);
   ObjectSetInteger(0, baseName + "_vline", OBJPROP_WIDTH, 3);
   ObjectSetInteger(0, baseName + "_vline", OBJPROP_STYLE, STYLE_SOLID);

   // Shaded zone from entry to TP
   ObjectCreate(0, baseName + "_zone", OBJ_RECTANGLE, 0,
                g_CurrentSignal.time, g_CurrentSignal.entryPrice,
                g_CurrentSignal.time + PeriodSeconds(PERIOD_CURRENT) * 30, g_CurrentSignal.takeProfit);
   ObjectSetInteger(0, baseName + "_zone", OBJPROP_COLOR, signalColor);
   ObjectSetInteger(0, baseName + "_zone", OBJPROP_FILL, true);
   ObjectSetInteger(0, baseName + "_zone", OBJPROP_BACK, true);
   ObjectSetInteger(0, baseName + "_zone", OBJPROP_WIDTH, 1);

   // Label at top with timestamp
   string timeStr = ShowAlertTimestamp ? TimeToString(g_CurrentSignal.time, TIME_DATE|TIME_MINUTES) : "";
   string labelText = StringFormat("%s %s [%d] | %s%s%s | Hold: %s",
                                    g_CurrentSignal.perspectiveText,
                                    g_CurrentSignal.isBuy ? "BUY" : "SELL",
                                    g_CurrentSignal.confluenceScore,
                                    g_CurrentSignal.confirmingTFs,
                                    ShowAlertTimestamp ? " | 🕐 " : "",
                                    ShowAlertTimestamp ? timeStr : "",
                                    g_CurrentSignal.holdTime);

   double labelPrice = g_CurrentSignal.isBuy ? g_CurrentSignal.takeProfit : g_CurrentSignal.entryPrice;

   ObjectCreate(0, baseName + "_label", OBJ_TEXT, 0, g_CurrentSignal.time, labelPrice);
   ObjectSetString(0, baseName + "_label", OBJPROP_TEXT, labelText);
   ObjectSetInteger(0, baseName + "_label", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, baseName + "_label", OBJPROP_FONTSIZE, SignalFontSize);
   ObjectSetString(0, baseName + "_label", OBJPROP_FONT, "Arial Bold");

   // SL and TP lines
   ObjectCreate(0, baseName + "_tp", OBJ_TREND, 0,
                g_CurrentSignal.time, g_CurrentSignal.takeProfit,
                g_CurrentSignal.time + PeriodSeconds(PERIOD_CURRENT) * 30, g_CurrentSignal.takeProfit);
   ObjectSetInteger(0, baseName + "_tp", OBJPROP_COLOR, clrLime);
   ObjectSetInteger(0, baseName + "_tp", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_tp", OBJPROP_STYLE, STYLE_DASH);

   ObjectCreate(0, baseName + "_sl", OBJ_TREND, 0,
                g_CurrentSignal.time, g_CurrentSignal.stopLoss,
                g_CurrentSignal.time + PeriodSeconds(PERIOD_CURRENT) * 30, g_CurrentSignal.stopLoss);
   ObjectSetInteger(0, baseName + "_sl", OBJPROP_COLOR, clrRed);
   ObjectSetInteger(0, baseName + "_sl", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_sl", OBJPROP_STYLE, STYLE_DASH);
}

//+------------------------------------------------------------------+
//| STYLE C: Draw Advanced Label System                             |
//+------------------------------------------------------------------+
void DrawAdvancedLabel()
{
   string baseName = "SymMaster_SignalLabel_" + TimeToString(g_CurrentSignal.time);

   // Get signal color
   color signalColor = ScalpSignalColor;
   color textColor = clrWhite;
   if(g_CurrentSignal.perspective == PERSPECTIVE_INTRADAY)
      signalColor = IntradaySignalColor;
   else if(g_CurrentSignal.perspective == PERSPECTIVE_SWING)
      signalColor = SwingSignalColor;

   // Professional label with all details including timestamp
   string timeStr = ShowAlertTimestamp ? TimeToString(g_CurrentSignal.time, TIME_DATE|TIME_MINUTES) : "";

   string line1 = StringFormat("⚡ %s %s SIGNAL [Conf:%d/10 | Wgt:%d]%s%s",
                               g_CurrentSignal.perspectiveText,
                               g_CurrentSignal.isBuy ? "BUY" : "SELL",
                               g_CurrentSignal.confluenceScore,
                               g_CurrentSignal.tfWeight,
                               ShowAlertTimestamp ? " | 🕐 " : "",
                               ShowAlertTimestamp ? timeStr : "");

   string line2 = StringFormat("TFs Aligned: %s", g_CurrentSignal.confirmingTFs);

   string line3 = StringFormat("Entry: %.5f | SL: %.5f | TP: %.5f",
                               g_CurrentSignal.entryPrice,
                               g_CurrentSignal.stopLoss,
                               g_CurrentSignal.takeProfit);

   string line4 = StringFormat("Hold Time: %s | RR: %.1f:1",
                               g_CurrentSignal.holdTime,
                               g_CurrentSignal.riskReward);
   
   // Arrow indicator
   int arrowCode = g_CurrentSignal.isBuy ? 233 : 234;
   ObjectCreate(0, baseName + "_arrow", OBJ_ARROW, 0, g_CurrentSignal.time, g_CurrentSignal.entryPrice);
   ObjectSetInteger(0, baseName + "_arrow", OBJPROP_ARROWCODE, arrowCode);
   ObjectSetInteger(0, baseName + "_arrow", OBJPROP_COLOR, signalColor);
   ObjectSetInteger(0, baseName + "_arrow", OBJPROP_WIDTH, 4);
   
   // Multi-line text label
   double labelOffset = g_CurrentSignal.isBuy ? 200 * _Point : -200 * _Point;
   
   ObjectCreate(0, baseName + "_line1", OBJ_TEXT, 0, g_CurrentSignal.time, g_CurrentSignal.entryPrice + labelOffset);
   ObjectSetString(0, baseName + "_line1", OBJPROP_TEXT, line1);
   ObjectSetInteger(0, baseName + "_line1", OBJPROP_COLOR, signalColor);
   ObjectSetInteger(0, baseName + "_line1", OBJPROP_FONTSIZE, SignalFontSize + 2);
   ObjectSetString(0, baseName + "_line1", OBJPROP_FONT, "Arial Black");
   
   ObjectCreate(0, baseName + "_line2", OBJ_TEXT, 0, g_CurrentSignal.time, g_CurrentSignal.entryPrice + labelOffset - (50 * _Point));
   ObjectSetString(0, baseName + "_line2", OBJPROP_TEXT, line2);
   ObjectSetInteger(0, baseName + "_line2", OBJPROP_COLOR, textColor);
   ObjectSetInteger(0, baseName + "_line2", OBJPROP_FONTSIZE, SignalFontSize);
   ObjectSetString(0, baseName + "_line2", OBJPROP_FONT, "Arial");
   
   ObjectCreate(0, baseName + "_line3", OBJ_TEXT, 0, g_CurrentSignal.time, g_CurrentSignal.entryPrice + labelOffset - (100 * _Point));
   ObjectSetString(0, baseName + "_line3", OBJPROP_TEXT, line3);
   ObjectSetInteger(0, baseName + "_line3", OBJPROP_COLOR, textColor);
   ObjectSetInteger(0, baseName + "_line3", OBJPROP_FONTSIZE, SignalFontSize);
   ObjectSetString(0, baseName + "_line3", OBJPROP_FONT, "Arial");
   
   ObjectCreate(0, baseName + "_line4", OBJ_TEXT, 0, g_CurrentSignal.time, g_CurrentSignal.entryPrice + labelOffset - (150 * _Point));
   ObjectSetString(0, baseName + "_line4", OBJPROP_TEXT, line4);
   ObjectSetInteger(0, baseName + "_line4", OBJPROP_COLOR, textColor);
   ObjectSetInteger(0, baseName + "_line4", OBJPROP_FONTSIZE, SignalFontSize);
   ObjectSetString(0, baseName + "_line4", OBJPROP_FONT, "Arial");
   
   // Entry, SL, TP horizontal lines
   datetime lineEnd = g_CurrentSignal.time + PeriodSeconds(PERIOD_CURRENT) * 40;
   
   ObjectCreate(0, baseName + "_entry_line", OBJ_TREND, 0, g_CurrentSignal.time, g_CurrentSignal.entryPrice, lineEnd, g_CurrentSignal.entryPrice);
   ObjectSetInteger(0, baseName + "_entry_line", OBJPROP_COLOR, clrYellow);
   ObjectSetInteger(0, baseName + "_entry_line", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_entry_line", OBJPROP_RAY_RIGHT, true);
   
   ObjectCreate(0, baseName + "_tp_line", OBJ_TREND, 0, g_CurrentSignal.time, g_CurrentSignal.takeProfit, lineEnd, g_CurrentSignal.takeProfit);
   ObjectSetInteger(0, baseName + "_tp_line", OBJPROP_COLOR, clrLime);
   ObjectSetInteger(0, baseName + "_tp_line", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_tp_line", OBJPROP_STYLE, STYLE_DOT);
   ObjectSetInteger(0, baseName + "_tp_line", OBJPROP_RAY_RIGHT, true);
   
   ObjectCreate(0, baseName + "_sl_line", OBJ_TREND, 0, g_CurrentSignal.time, g_CurrentSignal.stopLoss, lineEnd, g_CurrentSignal.stopLoss);
   ObjectSetInteger(0, baseName + "_sl_line", OBJPROP_COLOR, clrRed);
   ObjectSetInteger(0, baseName + "_sl_line", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, baseName + "_sl_line", OBJPROP_STYLE, STYLE_DOT);
   ObjectSetInteger(0, baseName + "_sl_line", OBJPROP_RAY_RIGHT, true);
}

//+------------------------------------------------------------------+
//| Draw Chart Objects                                               |
//+------------------------------------------------------------------+
void DrawChartObjects()
{
   if(!DrawOrderBlocks && !DrawFairValueGaps && !DrawLiquidityZones)
      return;
   
   // Draw for current timeframe only (to avoid clutter)
   ENUM_TIMEFRAMES currentTF = PERIOD_CURRENT;
   int tfIndex = -1;
   
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      if(g_TFAnalysis[i].timeframe == currentTF)
      {
         tfIndex = i;
         break;
      }
   }
   
   if(tfIndex < 0) return;
   
   DrawTimeframeObjects(g_TFAnalysis[tfIndex]);
}

//+------------------------------------------------------------------+
//| Draw Objects for Specific Timeframe                             |
//+------------------------------------------------------------------+
void DrawTimeframeObjects(TimeframeAnalysis &tf)
{
   // Draw Order Blocks
   if(DrawOrderBlocks && tf.strongestBullOB > 0)
   {
      string name = "SymMaster_BullOB_" + tf.tfName;
      datetime time = TimeCurrent();
      datetime endTime = time + PeriodSeconds(tf.timeframe) * 20;
      
      if(ObjectFind(0, name) < 0)
      {
         ObjectCreate(0, name, OBJ_RECTANGLE, 0, 
                     time, tf.strongestBullOB - 50*_Point,
                     endTime, tf.strongestBullOB + 50*_Point);
         ObjectSetInteger(0, name, OBJPROP_COLOR, clrGreen);
         ObjectSetInteger(0, name, OBJPROP_FILL, true);
         ObjectSetInteger(0, name, OBJPROP_BACK, true);
         ObjectSetInteger(0, name, OBJPROP_WIDTH, 1);
      }
   }
   
   if(DrawOrderBlocks && tf.strongestBearOB > 0)
   {
      string name = "SymMaster_BearOB_" + tf.tfName;
      datetime time = TimeCurrent();
      datetime endTime = time + PeriodSeconds(tf.timeframe) * 20;
      
      if(ObjectFind(0, name) < 0)
      {
         ObjectCreate(0, name, OBJ_RECTANGLE, 0, 
                     time, tf.strongestBearOB - 50*_Point,
                     endTime, tf.strongestBearOB + 50*_Point);
         ObjectSetInteger(0, name, OBJPROP_COLOR, clrRed);
         ObjectSetInteger(0, name, OBJPROP_FILL, true);
         ObjectSetInteger(0, name, OBJPROP_BACK, true);
         ObjectSetInteger(0, name, OBJPROP_WIDTH, 1);
      }
   }
   
   // Draw Liquidity Zones
   if(DrawLiquidityZones)
   {
      if(tf.buyLiquidity > 0)
      {
         string name = "SymMaster_BuyLiq_" + tf.tfName;
         datetime time = TimeCurrent();
         datetime endTime = time + PeriodSeconds(tf.timeframe) * 20;
         
         if(ObjectFind(0, name) < 0)
         {
            ObjectCreate(0, name, OBJ_TREND, 0, time, tf.buyLiquidity, 
                        endTime, tf.buyLiquidity);
            ObjectSetInteger(0, name, OBJPROP_COLOR, clrLime);
            ObjectSetInteger(0, name, OBJPROP_STYLE, STYLE_DASHDOTDOT);
            ObjectSetInteger(0, name, OBJPROP_WIDTH, 2);
            ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, true);
         }
      }
      
      if(tf.sellLiquidity > 0)
      {
         string name = "SymMaster_SellLiq_" + tf.tfName;
         datetime time = TimeCurrent();
         datetime endTime = time + PeriodSeconds(tf.timeframe) * 20;
         
         if(ObjectFind(0, name) < 0)
         {
            ObjectCreate(0, name, OBJ_TREND, 0, time, tf.sellLiquidity, 
                        endTime, tf.sellLiquidity);
            ObjectSetInteger(0, name, OBJPROP_COLOR, clrRed);
            ObjectSetInteger(0, name, OBJPROP_STYLE, STYLE_DASHDOTDOT);
            ObjectSetInteger(0, name, OBJPROP_WIDTH, 2);
            ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, true);
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Get Timeframe Name                                               |
//+------------------------------------------------------------------+
string GetTimeframeName(ENUM_TIMEFRAMES tf)
{
   switch(tf)
   {
      case PERIOD_M1: return "M1";
      case PERIOD_M5: return "M5";
      case PERIOD_M15: return "M15";
      case PERIOD_M30: return "M30";
      case PERIOD_H1: return "H1";
      case PERIOD_H4: return "H4";
      case PERIOD_D1: return "D1";
      default: return "??";
   }
}

//+------------------------------------------------------------------+
//| Create Dashboard                                                 |
//+------------------------------------------------------------------+
void CreateDashboard()
{
   int panelWidth = 380;
   int panelHeight = 120 + (g_ActiveTFCount * 35) + 90;
   
   // Main panel
   ObjectCreate(0, "SymMaster_Panel", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_XDISTANCE, DashboardXPos);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_YDISTANCE, DashboardYPos);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_XSIZE, panelWidth);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_YSIZE, panelHeight);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_BGCOLOR, DashboardBackground);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_BORDER_TYPE, BORDER_FLAT);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_COLOR, DashboardBorder);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_WIDTH, 3);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_BACK, false);
   ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_SELECTABLE, false);
   
   // Title
   ObjectCreate(0, "SymMaster_Title", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_Title", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_Title", OBJPROP_XDISTANCE, DashboardXPos + 15);
   ObjectSetInteger(0, "SymMaster_Title", OBJPROP_YDISTANCE, DashboardYPos + 12);
   ObjectSetString(0, "SymMaster_Title", OBJPROP_TEXT, "🔥 SYMBOL MASTER PRO");
   ObjectSetInteger(0, "SymMaster_Title", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, "SymMaster_Title", OBJPROP_FONTSIZE, 14);
   ObjectSetString(0, "SymMaster_Title", OBJPROP_FONT, "Arial Black");
   
   // Toggle Button
   ObjectCreate(0, "SymMaster_ToggleBtn", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_XDISTANCE, DashboardXPos + panelWidth - 70);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_YDISTANCE, DashboardYPos + 10);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_XSIZE, 60);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_YSIZE, 25);
   ObjectSetString(0, "SymMaster_ToggleBtn", OBJPROP_TEXT, "HIDE");
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_FONTSIZE, 9);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_BGCOLOR, clrDarkOrange);
   ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_BORDER_COLOR, clrGold);

   // === STYLE SELECTOR BUTTONS ===
   ObjectCreate(0, "SymMaster_StyleA", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_XDISTANCE, DashboardXPos + 15);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_YDISTANCE, DashboardYPos + 45);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_XSIZE, 80);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_YSIZE, 30);
   ObjectSetString(0, "SymMaster_StyleA", OBJPROP_TEXT, "BOX");
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_FONTSIZE, 9);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BGCOLOR, clrDarkGreen);
   ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_BORDER_COLOR, clrLime);

   ObjectCreate(0, "SymMaster_StyleB", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_XDISTANCE, DashboardXPos + 100);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_YDISTANCE, DashboardYPos + 45);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_XSIZE, 80);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_YSIZE, 30);
   ObjectSetString(0, "SymMaster_StyleB", OBJPROP_TEXT, "ZONE");
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_FONTSIZE, 9);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_BORDER_COLOR, clrGray);

   ObjectCreate(0, "SymMaster_StyleC", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_XDISTANCE, DashboardXPos + 185);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_YDISTANCE, DashboardYPos + 45);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_XSIZE, 80);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_YSIZE, 30);
   ObjectSetString(0, "SymMaster_StyleC", OBJPROP_TEXT, "ADVANCED");
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_FONTSIZE, 9);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_BORDER_COLOR, clrGray);

   // === MODE TOGGLE (Clickable label - DIFFERENT style than buttons) ===
   // Background rectangle (CLICKABLE)
   ObjectCreate(0, "SymMaster_ModeToggleBG", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_XDISTANCE, DashboardXPos + 270);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_YDISTANCE, DashboardYPos + 45);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_XSIZE, 105);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_YSIZE, 30);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_BGCOLOR, clrBlack);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_BORDER_TYPE, BORDER_FLAT);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_WIDTH, 3);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_BACK, false);
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_SELECTABLE, true);  // Make clickable
   ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_SELECTED, false);

   // Clickable text label on top
   ObjectCreate(0, "SymMaster_ModeToggle", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_ModeToggle", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_ModeToggle", OBJPROP_XDISTANCE, DashboardXPos + 285);
   ObjectSetInteger(0, "SymMaster_ModeToggle", OBJPROP_YDISTANCE, DashboardYPos + 52);
   ObjectSetString(0, "SymMaster_ModeToggle", OBJPROP_TEXT, g_MultiSymbolMode ? "🔄 SINGLE" : "🔄 MULTI");
   ObjectSetInteger(0, "SymMaster_ModeToggle", OBJPROP_COLOR, clrYellow);
   ObjectSetInteger(0, "SymMaster_ModeToggle", OBJPROP_FONTSIZE, 10);
   ObjectSetString(0, "SymMaster_ModeToggle", OBJPROP_FONT, "Arial Bold");

   // Symbol name
   ObjectCreate(0, "SymMaster_Symbol", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_XDISTANCE, DashboardXPos + 15);
   ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_YDISTANCE, DashboardYPos + 80);
   ObjectSetString(0, "SymMaster_Symbol", OBJPROP_TEXT, "Symbol: " + g_Symbol);
   ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_FONTSIZE, 11);
   ObjectSetString(0, "SymMaster_Symbol", OBJPROP_FONT, "Arial");
   
   // Separator line
   ObjectCreate(0, "SymMaster_Separator", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_XDISTANCE, DashboardXPos + 15);
   ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_YDISTANCE, DashboardYPos + 100);
   ObjectSetString(0, "SymMaster_Separator", OBJPROP_TEXT, "________________________________");
   ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_FONTSIZE, 8);
   
   // Create clickable buttons for each timeframe
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      string btnName = "SymMaster_TFBtn_" + IntegerToString(i);
      
      ObjectCreate(0, btnName, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, btnName, OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, btnName, OBJPROP_XDISTANCE, DashboardXPos + 15);
      ObjectSetInteger(0, btnName, OBJPROP_YDISTANCE, DashboardYPos + 120 + (i * 35));
      ObjectSetInteger(0, btnName, OBJPROP_XSIZE, 350);
      ObjectSetInteger(0, btnName, OBJPROP_YSIZE, 30);
      ObjectSetInteger(0, btnName, OBJPROP_FONTSIZE, 10);
      ObjectSetInteger(0, btnName, OBJPROP_COLOR, clrWhite);
      ObjectSetInteger(0, btnName, OBJPROP_BGCOLOR, clrDarkSlateGray);
      ObjectSetInteger(0, btnName, OBJPROP_BORDER_COLOR, clrGray);
      ObjectSetString(0, btnName, OBJPROP_FONT, "Arial Bold");
   }
   
   // Signal panel
   if(ShowSignalPanel)
   {
      int signalY = DashboardYPos + panelHeight - 80;
      
      ObjectCreate(0, "SymMaster_SignalSep", OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_XDISTANCE, DashboardXPos + 15);
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_YDISTANCE, signalY - 10);
      ObjectSetString(0, "SymMaster_SignalSep", OBJPROP_TEXT, "________________________________");
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_COLOR, clrGold);
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_FONTSIZE, 8);
      
      ObjectCreate(0, "SymMaster_SignalTitle", OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_XDISTANCE, DashboardXPos + 15);
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_YDISTANCE, signalY + 5);
      ObjectSetString(0, "SymMaster_SignalTitle", OBJPROP_TEXT, "🎯 CURRENT SIGNAL:");
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_COLOR, clrGold);
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_FONTSIZE, 11);
      ObjectSetString(0, "SymMaster_SignalTitle", OBJPROP_FONT, "Arial Bold");
      
      ObjectCreate(0, "SymMaster_SignalText", OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_XDISTANCE, DashboardXPos + 15);
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_YDISTANCE, signalY + 30);
      ObjectSetString(0, "SymMaster_SignalText", OBJPROP_TEXT, "Waiting for confluence...");
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_COLOR, clrWhite);
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_FONTSIZE, 10);
   }
   
   // Initialize signal panel with current style
   UpdateSignalPanel();
   
   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Update Dashboard                                                 |
//+------------------------------------------------------------------+
void UpdateDashboard()
{
   if(!ShowDashboard) return;
   
   // Update each timeframe display
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      string btnName = "SymMaster_TFBtn_" + IntegerToString(i);
      
      string biasText = "";
      color bgColor = clrDarkSlateGray;
      
      if(g_TFAnalysis[i].bias == 1)
      {
         biasText = "🟢 BULLISH";
         bgColor = clrDarkGreen;
      }
      else if(g_TFAnalysis[i].bias == -1)
      {
         biasText = "🟢 BEARISH";
         bgColor = clrDarkRed;
      }
      else
      {
         biasText = "⚪ NEUTRAL";
         bgColor = clrDarkSlateGray;
      }
      
      string text = StringFormat("%s: %s [%d] | OB:%d/%d | FVG:%d/%d", 
                                 g_TFAnalysis[i].tfName, 
                                 biasText, 
                                 g_TFAnalysis[i].confidence,
                                 g_TFAnalysis[i].bullishOBCount,
                                 g_TFAnalysis[i].bearishOBCount,
                                 g_TFAnalysis[i].bullishFVGCount,
                                 g_TFAnalysis[i].bearishFVGCount);
      
      ObjectSetString(0, btnName, OBJPROP_TEXT, text);
      ObjectSetInteger(0, btnName, OBJPROP_BGCOLOR, bgColor);
   }
   
   // Update signal panel with current style and signal info
   if(ShowSignalPanel)
   {
      UpdateSignalPanel();
   }
   
   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Update Dashboard Visibility (Show/Hide)                         |
//+------------------------------------------------------------------+
void UpdateDashboardVisibility()
{
   if(g_DashboardExpanded)
   {
      // Show full panel
      int panelWidth = 380;
      int panelHeight = 120 + (g_ActiveTFCount * 35) + 90;
      
      ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_YSIZE, panelHeight);
      ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         string btnName = "SymMaster_TFBtn_" + IntegerToString(i);
         ObjectSetInteger(0, btnName, OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      }
      
      ObjectSetString(0, "SymMaster_ToggleBtn", OBJPROP_TEXT, "HIDE");
      ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_BGCOLOR, clrDarkOrange);
   }
   else
   {
      // Collapse to compact title bar only
      int compactHeight = 45;
      
      // Resize panel to compact size
      ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_YSIZE, compactHeight);
      ObjectSetInteger(0, "SymMaster_Panel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
      
      // Hide all content except title and button
      ObjectSetInteger(0, "SymMaster_Symbol", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
      ObjectSetInteger(0, "SymMaster_Separator", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
      ObjectSetInteger(0, "SymMaster_SignalSep", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
      ObjectSetInteger(0, "SymMaster_SignalTitle", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
      ObjectSetInteger(0, "SymMaster_SignalText", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
      
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         string btnName = "SymMaster_TFBtn_" + IntegerToString(i);
         ObjectSetInteger(0, btnName, OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
      }
      
      ObjectSetString(0, "SymMaster_ToggleBtn", OBJPROP_TEXT, "SHOW");
      ObjectSetInteger(0, "SymMaster_ToggleBtn", OBJPROP_BGCOLOR, clrDarkGreen);
      
      // Close any open mini chart when hiding
      if(g_ActiveMiniChart >= 0)
         CloseMiniChart();
   }
   
   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Create Multi-Symbol Compact Dashboards                          |
//+------------------------------------------------------------------+
void CreateMultiSymbolDashboards()
{
   int compactWidth = 200;
   int compactHeight = MultiSymbolCompactSize;
   int spacing = 10;
   int columns = 2;  // 2 columns of dashboards

   // Delete old single-symbol timeframe buttons
   for(int i = 0; i < 7; i++)
   {
      ObjectDelete(0, "SymMaster_TFBtn_" + IntegerToString(i));
   }

   // Create compact dashboard for each symbol
   for(int symIdx = 0; symIdx < g_MultiSymbolCount; symIdx++)
   {
      int row = symIdx / columns;
      int col = symIdx % columns;

      int boxX = DashboardXPos + 15 + (col * (compactWidth + spacing));
      int boxY = DashboardYPos + 120 + (row * (compactHeight + spacing));

      string basePrefix = "SymMaster_Multi_" + IntegerToString(symIdx);

      // Create compact panel background
      ObjectCreate(0, basePrefix + "_Panel", OBJ_RECTANGLE_LABEL, 0, 0, 0);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_XDISTANCE, boxX);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_YDISTANCE, boxY);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_XSIZE, compactWidth);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_YSIZE, compactHeight);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_BGCOLOR, C'30,30,40');
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_BORDER_TYPE, BORDER_FLAT);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_COLOR, clrDarkGray);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_WIDTH, 2);
      ObjectSetInteger(0, basePrefix + "_Panel", OBJPROP_BACK, false);

      // Symbol name header
      ObjectCreate(0, basePrefix + "_Symbol", OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, basePrefix + "_Symbol", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, basePrefix + "_Symbol", OBJPROP_XDISTANCE, boxX + 10);
      ObjectSetInteger(0, basePrefix + "_Symbol", OBJPROP_YDISTANCE, boxY + 8);
      ObjectSetString(0, basePrefix + "_Symbol", OBJPROP_TEXT, g_MultiSymbols[symIdx]);
      ObjectSetInteger(0, basePrefix + "_Symbol", OBJPROP_COLOR, clrGold);
      ObjectSetInteger(0, basePrefix + "_Symbol", OBJPROP_FONTSIZE, 10);
      ObjectSetString(0, basePrefix + "_Symbol", OBJPROP_FONT, "Arial Bold");

      // Timeframe rows (compact layout)
      int tfY = boxY + 30;
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         ObjectCreate(0, basePrefix + "_TF_" + IntegerToString(i), OBJ_LABEL, 0, 0, 0);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_XDISTANCE, boxX + 10);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_YDISTANCE, tfY + (i * 17));
         ObjectSetString(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_TEXT, "M1: ◯ NEUTRAL");
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_COLOR, clrGray);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_FONTSIZE, 8);
         ObjectSetString(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_FONT, "Arial");
      }

      // Signal status at bottom
      int signalY = boxY + compactHeight - 25;
      ObjectCreate(0, basePrefix + "_Signal", OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, basePrefix + "_Signal", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, basePrefix + "_Signal", OBJPROP_XDISTANCE, boxX + 10);
      ObjectSetInteger(0, basePrefix + "_Signal", OBJPROP_YDISTANCE, signalY);
      ObjectSetString(0, basePrefix + "_Signal", OBJPROP_TEXT, "Signal: Waiting...");
      ObjectSetInteger(0, basePrefix + "_Signal", OBJPROP_COLOR, clrYellow);
      ObjectSetInteger(0, basePrefix + "_Signal", OBJPROP_FONTSIZE, 8);
      ObjectSetString(0, basePrefix + "_Signal", OBJPROP_FONT, "Arial Bold");
   }

   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Update Multi-Symbol Dashboards                                   |
//+------------------------------------------------------------------+
void UpdateMultiSymbolDashboards()
{
   for(int symIdx = 0; symIdx < g_MultiSymbolCount; symIdx++)
   {
      string basePrefix = "SymMaster_Multi_" + IntegerToString(symIdx);

      // Update each timeframe display
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         string objName = basePrefix + "_TF_" + IntegerToString(i);
         TimeframeAnalysis tf = g_MultiTFAnalysis[symIdx][i];

         string biasText = "";
         color textColor = clrGray;

         if(tf.bias == 1)
         {
            biasText = "🟢 B";
            textColor = clrLime;
         }
         else if(tf.bias == -1)
         {
            biasText = "🔴 B";
            textColor = clrRed;
         }
         else
         {
            biasText = "◯ N";
            textColor = clrGray;
         }

         // Compact format: "M5: 🟢 B [7] | OB:0/0"
         string displayText = StringFormat("%s: %s [%d] | OB:%d/%d FVG:%d/%d",
                                           tf.tfName,
                                           biasText,
                                           tf.confidence,
                                           tf.bullishOBCount, tf.bearishOBCount,
                                           tf.bullishFVGCount, tf.bearishFVGCount);

         ObjectSetString(0, objName, OBJPROP_TEXT, displayText);
         ObjectSetInteger(0, objName, OBJPROP_COLOR, textColor);
      }

      // Update signal status
      string signalObjName = basePrefix + "_Signal";
      if(g_MultiSignalActive[symIdx])
      {
         ConfluenceSignal signal = g_MultiCurrentSignal[symIdx];
         string signalText = StringFormat("✓ %s %s [%d]",
                                          signal.perspectiveText,
                                          signal.isBuy ? "BUY" : "SELL",
                                          signal.confluenceScore);
         ObjectSetString(0, signalObjName, OBJPROP_TEXT, signalText);
         ObjectSetInteger(0, signalObjName, OBJPROP_COLOR, signal.isBuy ? clrLime : clrRed);
      }
      else
      {
         ObjectSetString(0, signalObjName, OBJPROP_TEXT, "Signal: Waiting...");
         ObjectSetInteger(0, signalObjName, OBJPROP_COLOR, clrYellow);
      }
   }

   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Update Signal Panel                                              |
//+------------------------------------------------------------------+
void UpdateSignalPanel()
{
   string styleText = "";
   switch(g_ActiveSignalStyle)
   {
      case STYLE_BOX_PANEL:
         styleText = "Display Style: BOX PANEL";
         break;
      case STYLE_VERTICAL_ZONE:
         styleText = "Display Style: VERTICAL ZONE";
         break;
      case STYLE_ADVANCED_LABEL:
         styleText = "Display Style: ADVANCED LABEL";
         break;
   }
   
   // Update signal panel if it exists
   if(ObjectFind(0, "SymMaster_SignalText") >= 0)
   {
      string currentText = ObjectGetString(0, "SymMaster_SignalText", OBJPROP_TEXT);
      
      // If signal is active, show signal info with style
      if(g_SignalActive)
      {
         string signalInfo = StringFormat("%s %s @ %.5f\nConfluence: %d/10 | %s\nRR: %.1f | %s\n%s",
                                          g_CurrentSignal.isBuy ? "BUY" : "SELL",
                                          g_CurrentSignal.perspectiveText,
                                          g_CurrentSignal.entryPrice,
                                          g_CurrentSignal.confluenceScore,
                                          g_CurrentSignal.confirmingTFs,
                                          g_CurrentSignal.riskReward,
                                          g_CurrentSignal.holdTime,
                                          styleText);
         ObjectSetString(0, "SymMaster_SignalText", OBJPROP_TEXT, signalInfo);
      }
      else
      {
         // Show style even when no signal
         ObjectSetString(0, "SymMaster_SignalText", OBJPROP_TEXT, styleText + "\nAwaiting Signal...");
      }
   }
}

//+------------------------------------------------------------------+
//| Create Mini Chart Window                                         |
//+------------------------------------------------------------------+
void CreateMiniChart(int tfIndex)
{
   if(tfIndex < 0 || tfIndex >= g_ActiveTFCount) return;
   
   int miniWidth = 420;
   int miniHeight = 320;
   int miniX = DashboardXPos + 400;
   int miniY = DashboardYPos;
   
   // Background panel
   ObjectCreate(0, "SymMaster_MiniPanel", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_XDISTANCE, miniX);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_YDISTANCE, miniY);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_XSIZE, miniWidth);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_YSIZE, miniHeight);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_BGCOLOR, MinChartBackground);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_BORDER_TYPE, BORDER_FLAT);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_BACK, false);
   ObjectSetInteger(0, "SymMaster_MiniPanel", OBJPROP_SELECTABLE, false);
   
   // Title
   string title = "📊 " + g_TFAnalysis[tfIndex].tfName + " Chart - " + g_Symbol;
   ObjectCreate(0, "SymMaster_MiniTitle", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_MiniTitle", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_MiniTitle", OBJPROP_XDISTANCE, miniX + 15);
   ObjectSetInteger(0, "SymMaster_MiniTitle", OBJPROP_YDISTANCE, miniY + 10);
   ObjectSetString(0, "SymMaster_MiniTitle", OBJPROP_TEXT, title);
   ObjectSetInteger(0, "SymMaster_MiniTitle", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, "SymMaster_MiniTitle", OBJPROP_FONTSIZE, 11);
   ObjectSetString(0, "SymMaster_MiniTitle", OBJPROP_FONT, "Arial Bold");
   
   // Close button
   ObjectCreate(0, "SymMaster_MiniClose", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_XDISTANCE, miniX + miniWidth - 60);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_YDISTANCE, miniY + 8);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_XSIZE, 50);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_YSIZE, 22);
   ObjectSetString(0, "SymMaster_MiniClose", OBJPROP_TEXT, "✖ Close");
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_FONTSIZE, 8);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_BGCOLOR, clrDarkRed);
   ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_BORDER_COLOR, clrRed);
   
   // Get price data for the timeframe
   double open[], high[], low[], close[];
   ArraySetAsSeries(open, true);
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   ArraySetAsSeries(close, true);
   
   int bars = 30;
   CopyOpen(g_Symbol, g_TFAnalysis[tfIndex].timeframe, 0, bars, open);
   CopyHigh(g_Symbol, g_TFAnalysis[tfIndex].timeframe, 0, bars, high);
   CopyLow(g_Symbol, g_TFAnalysis[tfIndex].timeframe, 0, bars, low);
   CopyClose(g_Symbol, g_TFAnalysis[tfIndex].timeframe, 0, bars, close);
   
   // Find price range
   double maxPrice = high[0];
   double minPrice = low[0];
   for(int i = 0; i < bars && i < ArraySize(high); i++)
   {
      if(high[i] > maxPrice) maxPrice = high[i];
      if(low[i] < minPrice) minPrice = low[i];
   }
   
   double priceRange = maxPrice - minPrice;
   int chartHeight = miniHeight - 100;
   int chartTop = miniY + 45;
   int chartLeft = miniX + 15;
   int chartWidth = miniWidth - 30;
   int barWidth = chartWidth / bars;
   
   // Draw enhanced candlesticks with better visibility
   for(int i = 0; i < bars && i < ArraySize(open); i++)
   {
      string candleName = "SymMaster_MiniCandle_" + IntegerToString(i);

      int barX = chartLeft + ((bars - 1 - i) * barWidth);
      int openY = chartTop + (int)((maxPrice - open[i]) / priceRange * chartHeight);
      int closeY = chartTop + (int)((maxPrice - close[i]) / priceRange * chartHeight);
      int highY = chartTop + (int)((maxPrice - high[i]) / priceRange * chartHeight);
      int lowY = chartTop + (int)((maxPrice - low[i]) / priceRange * chartHeight);

      // Determine candle color and type
      bool isBullish = close[i] > open[i];  // Bullish = close higher than open
      color candleColor = isBullish ? MinChartBullishColor : MinChartBearishColor;
      color wickColor = candleColor;

      // Draw upper wick (high to body top) as rectangle label for better visibility
      int wickWidth = MathMax(1, barWidth / 4);
      int wickX = barX + (barWidth / 2) - (wickWidth / 2);

      int bodyTop = MathMin(openY, closeY);
      int bodyBottom = MathMax(openY, closeY);

      // Upper wick
      if(highY < bodyTop)
      {
         ObjectCreate(0, candleName + "_wick_upper", OBJ_RECTANGLE_LABEL, 0, 0, 0);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_XDISTANCE, wickX);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_YDISTANCE, highY);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_XSIZE, wickWidth);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_YSIZE, bodyTop - highY);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_BGCOLOR, wickColor);
         ObjectSetInteger(0, candleName + "_wick_upper", OBJPROP_BORDER_TYPE, BORDER_FLAT);
      }

      // Lower wick
      if(lowY > bodyBottom)
      {
         ObjectCreate(0, candleName + "_wick_lower", OBJ_RECTANGLE_LABEL, 0, 0, 0);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_XDISTANCE, wickX);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_YDISTANCE, bodyBottom);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_XSIZE, wickWidth);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_YSIZE, lowY - bodyBottom);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_BGCOLOR, wickColor);
         ObjectSetInteger(0, candleName + "_wick_lower", OBJPROP_BORDER_TYPE, BORDER_FLAT);
      }

      // Draw body with better proportions
      int bodyHeight = MathMax(MathAbs(closeY - openY), 2);  // Minimum 2 pixels for visibility
      int bodyWidth = MathMax(barWidth - 2, 2);  // Ensure minimum width

      ObjectCreate(0, candleName + "_body", OBJ_RECTANGLE_LABEL, 0, 0, 0);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_XDISTANCE, barX + 1);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_YDISTANCE, bodyTop);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_XSIZE, bodyWidth);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_YSIZE, bodyHeight);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_BGCOLOR, candleColor);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_BORDER_TYPE, BORDER_FLAT);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_COLOR, candleColor);
      ObjectSetInteger(0, candleName + "_body", OBJPROP_WIDTH, 1);
   }
   
   // Display key stats
   int statsY = chartTop + chartHeight + 20;
   
   ObjectCreate(0, "SymMaster_MiniStats", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_XDISTANCE, miniX + 15);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_YDISTANCE, statsY);
   
   string bias = g_TFAnalysis[tfIndex].bias == 1 ? "🟢 BULLISH" : 
                 g_TFAnalysis[tfIndex].bias == -1 ? "🟢 BEARISH" : "⚪ NEUTRAL";
   
   string stats = StringFormat("Bias: %s | Confidence: %d/10\nOB: %d Bull / %d Bear | FVG: %d Bull / %d Bear",
                               bias,
                               g_TFAnalysis[tfIndex].confidence,
                               g_TFAnalysis[tfIndex].bullishOBCount,
                               g_TFAnalysis[tfIndex].bearishOBCount,
                               g_TFAnalysis[tfIndex].bullishFVGCount,
                               g_TFAnalysis[tfIndex].bearishFVGCount);
   
   ObjectSetString(0, "SymMaster_MiniStats", OBJPROP_TEXT, stats);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_FONTSIZE, 9);
   
   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Close Mini Chart Window                                          |
//+------------------------------------------------------------------+
void CloseMiniChart()
{
   ObjectDelete(0, "SymMaster_MiniPanel");
   ObjectDelete(0, "SymMaster_MiniTitle");
   ObjectDelete(0, "SymMaster_MiniClose");
   ObjectDelete(0, "SymMaster_MiniStats");

   // Delete all enhanced candle objects (body + upper and lower wicks)
   for(int i = 0; i < 50; i++)
   {
      ObjectDelete(0, "SymMaster_MiniCandle_" + IntegerToString(i) + "_wick");
      ObjectDelete(0, "SymMaster_MiniCandle_" + IntegerToString(i) + "_wick_upper");
      ObjectDelete(0, "SymMaster_MiniCandle_" + IntegerToString(i) + "_wick_lower");
      ObjectDelete(0, "SymMaster_MiniCandle_" + IntegerToString(i) + "_body");
   }

   g_ActiveMiniChart = -1;
   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Delete Dashboard                                                 |
//+------------------------------------------------------------------+
void DeleteDashboard()
{
   ObjectDelete(0, "SymMaster_Panel");
   ObjectDelete(0, "SymMaster_Title");
   ObjectDelete(0, "SymMaster_ToggleBtn");
   ObjectDelete(0, "SymMaster_Symbol");
   ObjectDelete(0, "SymMaster_Separator");
   ObjectDelete(0, "SymMaster_SignalSep");
   ObjectDelete(0, "SymMaster_SignalTitle");
   ObjectDelete(0, "SymMaster_SignalText");
   ObjectDelete(0, "SymMaster_StyleA");
   ObjectDelete(0, "SymMaster_StyleB");
   ObjectDelete(0, "SymMaster_StyleC");
   ObjectDelete(0, "SymMaster_ModeToggle");  // Delete mode toggle label
   ObjectDelete(0, "SymMaster_ModeToggleBG");  // Delete mode toggle background

   // Delete single-symbol timeframe buttons
   for(int i = 0; i < 7; i++)
   {
      ObjectDelete(0, "SymMaster_TFBtn_" + IntegerToString(i));
   }

   // Delete multi-symbol dashboard objects
   for(int symIdx = 0; symIdx < MAX_MULTI_SYMBOLS; symIdx++)
   {
      string basePrefix = "SymMaster_Multi_" + IntegerToString(symIdx);

      ObjectDelete(0, basePrefix + "_Panel");
      ObjectDelete(0, basePrefix + "_Symbol");
      ObjectDelete(0, basePrefix + "_Signal");

      // Delete all timeframe labels for this symbol
      for(int i = 0; i < 7; i++)
      {
         ObjectDelete(0, basePrefix + "_TF_" + IntegerToString(i));
      }
   }

   CloseMiniChart();

   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Delete All Chart Objects                                         |
//+------------------------------------------------------------------+
void DeleteAllChartObjects()
{
   int total = ObjectsTotal(0);
   
   for(int i = total - 1; i >= 0; i--)
   {
      string name = ObjectName(0, i);
      
      if(StringFind(name, "SymMaster_") >= 0)
      {
         ObjectDelete(0, name);
      }
   }
   
   ChartRedraw();
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                    SYMBOL MASTER PRO - HIGH IMPACT VERSION       |
//|                  10 Profit-Maximizing Features Included          |
//|          Transform Signals Into Consistent, Repeatable Profits   |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_plots 0
#property copyright "Symbol Master Pro - High Impact Edition"
#property version   "3.00"
#property description "10 Professional Features | Risk Management | Trade Automation"

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
//| 🚀 HIGH-IMPACT PROFIT FEATURES (10 Features)                     |
//+------------------------------------------------------------------+

input group "=== 💎 FEATURE #1: DYNAMIC SL/TP CALCULATOR ==="
input bool EnableDynamicSLTP = true;           // Enable Dynamic SL/TP Calculator
input double SLATRMultiplier = 2.0;            // SL: ATR Multiplier
input double SLStructureBuffer = 5.0;          // SL: Structure Buffer (pips)
input double TP1_RiskReward = 1.5;             // TP1: Risk:Reward Ratio
input double TP2_RiskReward = 2.5;             // TP2: Risk:Reward Ratio
input double TP3_RiskReward = 4.0;             // TP3: Risk:Reward Ratio
input bool DrawSLTPLevels = true;              // Draw SL/TP Lines on Chart
input color SLColor = clrRed;                  // Stop Loss Color
input color TP1Color = clrLime;                // Take Profit 1 Color
input color TP2Color = clrGold;                // Take Profit 2 Color
input color TP3Color = clrDodgerBlue;          // Take Profit 3 Color

input group "=== 💰 FEATURE #2: POSITION SIZE CALCULATOR ==="
input bool EnablePositionSizing = true;        // Enable Auto Position Sizing
input double RiskPercentPerTrade = 1.0;        // Risk Per Trade (%)
input double MaxDailyRiskPercent = 3.0;        // Max Daily Risk (%)
input bool ShowPositionSizeInfo = true;        // Show Position Size in Dashboard
input bool AutoCalculateLotSize = true;        // Auto-Calculate Lot Size
input double MinLotSize = 0.01;                // Minimum Lot Size
input double MaxLotSize = 10.0;                // Maximum Lot Size

input group "=== 📈 FEATURE #3: WIN RATE TRACKER ==="
input bool EnablePerformanceTracking = true;   // Enable Performance Tracking
input bool ShowPerformancePanel = true;        // Show Performance Statistics
input bool TrackByPerspective = true;          // Track Stats by Perspective
input bool TrackByDirection = true;            // Track Stats by Direction (BUY/SELL)
input bool TrackBySession = true;              // Track Stats by Session
input bool SaveTradeHistory = true;            // Save Trade History to File
input string TradeHistoryFile = "SymbolMasterPro_Trades.csv"; // History File Name

input group "=== ⏰ FEATURE #4: SESSION FILTER ==="
input bool EnableSessionFilter = true;         // Enable Session Filter
input bool TradeLondonSession = true;          // Trade London Session (07:00-16:00 GMT)
input bool TradeNYSession = true;              // Trade NY Session (12:00-21:00 GMT)
input bool TradeAsianSession = false;          // Trade Asian Session (00:00-09:00 GMT)
input bool RequireLondonNYOverlap = false;     // Require London/NY Overlap (12:00-16:00)
input bool ShowCurrentSession = true;          // Show Current Session in Dashboard
input color LondonSessionColor = clrDodgerBlue;    // London Session Color
input color NYSessionColor = clrOrange;            // NY Session Color
input color AsianSessionColor = clrGray;           // Asian Session Color
input color OverlapSessionColor = clrLime;         // Overlap Session Color

input group "=== 📰 FEATURE #5: NEWS EVENT BLOCKER ==="
input bool EnableNewsFilter = true;            // Enable News Event Filter
input int NewsBufferMinutesBefore = 30;        // Block Signals X mins Before News
input int NewsBufferMinutesAfter = 60;         // Block Signals X mins After News
input bool BlockHighImpactOnly = true;         // Block High-Impact News Only
input bool BlockMediumImpact = false;          // Block Medium-Impact News
input bool ShowNextNewsEvent = true;           // Show Next News in Dashboard
input bool AlertBeforeNews = true;             // Alert X mins Before News
input int AlertBeforeNewsMinutes = 15;         // Alert This Many mins Before

input group "=== 📊 FEATURE #6: VOLATILITY FILTER (ADX + ATR) ==="
input bool EnableVolatilityFilter = true;      // Enable Volatility Filter
input double MinADXValue = 20.0;               // Minimum ADX (Trend Strength)
input double MaxADXValue = 60.0;               // Maximum ADX (Overextended)
input double MinATRRatio = 0.5;                // Min ATR Ratio (vs 50-bar avg)
input double MaxATRRatio = 2.0;                // Max ATR Ratio (vs 50-bar avg)
input bool ShowVolatilityInfo = true;          // Show ADX/ATR in Dashboard
input bool StrictVolatilityMode = false;       // Strict Mode (All TFs must pass)

input group "=== 📈 FEATURE #7: HIGHER TF TREND FILTER ==="
input bool EnableHTFTrendFilter = true;        // Enable HTF Trend Filter
input bool RequireH4Alignment = true;          // Require H4 Trend Alignment
input bool RequireD1Alignment = true;          // Require D1 Trend Alignment
input bool RequireAllTFsAligned = false;       // Require ALL Timeframes Aligned
input bool ShowHTFTrendInfo = true;            // Show HTF Trend in Dashboard
input int MinHTFConfidence = 5;                // Min HTF Confidence Score (1-10)

input group "=== 🎯 FEATURE #8: SUPPORT/RESISTANCE DETECTOR ==="
input bool EnableSRDetection = true;           // Enable S/R Zone Detection
input int SRLookbackBars = 100;                // S/R Lookback Period
input int SRZoneThicknessPips = 10;            // S/R Zone Thickness (pips)
input bool DetectSwingPoints = true;           // Detect Swing High/Low Zones
input bool DetectRoundNumbers = true;          // Detect Round Number Zones
input bool DetectDailyHighLow = true;          // Detect Previous Day High/Low
input bool DetectWeeklyHighLow = true;         // Detect Previous Week High/Low
input bool DrawSRZones = true;                 // Draw S/R Zones on Chart
input color SupportZoneColor = clrDodgerBlue;  // Support Zone Color
input color ResistanceZoneColor = clrCrimson;  // Resistance Zone Color
input int SRZoneTransparency = 80;             // Zone Transparency (0-100)
input bool RequireSRConfluence = true;         // Require S/R Confluence for Signals

input group "=== 🛡️ FEATURE #9: TRAILING STOP & BREAK-EVEN ==="
input bool EnableBreakEven = true;             // Enable Break-Even Manager
input double BreakEvenTriggerR = 1.0;          // Move to BE After X R-Multiple
input double BreakEvenLockR = 0.5;             // Lock in X R-Multiple at BE
input bool EnableTrailingStop = true;          // Enable Trailing Stop
input double TrailingStopTriggerR = 1.5;       // Start Trailing After X R-Multiple
input double TrailingStopATRMult = 2.0;        // Trail by X × ATR
input bool TrailBySwingPoints = false;         // Trail by Swing Highs/Lows (Conservative)
input bool EnablePartialProfits = true;        // Enable Partial Profit Taking
input double TP1ClosePercent = 50.0;           // Close X% at TP1
input double TP2ClosePercent = 30.0;           // Close X% at TP2
input bool ShowTradeManagementInfo = true;     // Show Trade Management in Dashboard

input group "=== 🚀 FEATURE #10: ONE-CLICK TRADE PANEL ==="
input bool EnableTradePanel = true;            // Enable One-Click Trade Panel
input bool ShowTradePanelOnSignal = true;      // Show Panel on New Signal
input bool AutoExecuteTrades = false;          // Auto-Execute (No Confirmation)
input int TradePanelXPos = 500;                // Trade Panel X Position
input int TradePanelYPos = 100;                // Trade Panel Y Position
input bool PlaySoundOnTradeExecution = true;   // Play Sound on Trade Execution
input bool AlertOnTradeExecution = true;       // Alert on Trade Execution
input color TradePanelBackground = clrDarkSlateGray; // Trade Panel Background
input color TradePanelBorder = clrGold;        // Trade Panel Border
input color ExecuteButtonColor = clrDarkGreen; // Execute Button Color
input color SkipButtonColor = clrDarkRed;      // Skip Button Color

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
//| FEATURE #1: Dynamic SL/TP Structure                              |
//+------------------------------------------------------------------+
struct TradeParameters
{
   double entryPrice;
   double stopLoss;
   double takeProfit1;     // 1.5R
   double takeProfit2;     // 2.5R
   double takeProfit3;     // 4.0R
   double riskInPips;
   double rewardInPips1;
   double rewardInPips2;
   double rewardInPips3;
   double lotSize;
   string symbol;
   bool isBuy;
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

// FEATURE #1: Dynamic SL/TP Global Variables
TradeParameters g_CurrentTradeParams;
bool g_TradeParamsActive = false;

// FEATURE #3: Win Rate Tracker Global Variables
int g_TotalSignals = 0;
int g_WinningSignals = 0;
int g_LosingSignals = 0;

// FEATURE #4: Session Filter Global Variables
string g_CurrentSession = "NONE";

// FEATURE #6: Volatility Filter Global Variables
int g_ADX_Handle = INVALID_HANDLE;

// FEATURE #10: Trade Panel Global Variables
bool g_TradePanelVisible = false;
datetime g_TradePanelSignalTime = 0;

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

   // FEATURE #1: Clear SL/TP levels
   ClearSLTPLevels();

   // FEATURE #10: Hide trade panel
   HideTradePanel();

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
      // DEBUG: Print all clicks
      Print(">>> CLICK DETECTED: ", sparam);

      // Check if toggle button clicked
      if(sparam == "SymMaster_ToggleBtn")
      {
         g_DashboardExpanded = !g_DashboardExpanded;
         UpdateDashboardVisibility();
         return;
      }
      
      // Check if timeframe button clicked (single-symbol mode)
      if(StringFind(sparam, "SymMaster_TFBtn_") >= 0)
      {
         // CRITICAL: Deselect button immediately to allow future clicks
         ObjectSetInteger(0, sparam, OBJPROP_STATE, false);

         // Extract timeframe index
         string indexStr = StringSubstr(sparam, 16);
         int tfIndex = (int)StringToInteger(indexStr);

         Print(">>> Single-mode TF button clicked: ", sparam, " tfIndex=", tfIndex);

         if(tfIndex >= 0 && tfIndex < g_ActiveTFCount)
         {
            // Toggle mini chart
            if(g_ActiveMiniChart == tfIndex)
            {
               // Close currently open mini chart
               Print(">>> Closing mini chart for TF ", tfIndex);
               CloseMiniChart();
            }
            else
            {
               // Close any open mini chart and open new one
               if(g_ActiveMiniChart >= 0)
                  CloseMiniChart();

               Print(">>> Opening mini chart for ", g_Symbol, " ", g_TFAnalysis[tfIndex].tfName);
               g_ActiveMiniChart = tfIndex;
               CreateMiniChart(g_Symbol, g_TFAnalysis[tfIndex].timeframe, g_TFAnalysis[tfIndex].tfName, g_TFAnalysis[tfIndex]);
            }
         }
         return;
      }

      // Check if multi-symbol timeframe button clicked (multi-symbol mode)
      if(StringFind(sparam, "SymMaster_Multi_") >= 0 && StringFind(sparam, "_TF_") >= 0)
      {
         // CRITICAL: Deselect button immediately to allow future clicks
         ObjectSetInteger(0, sparam, OBJPROP_STATE, false);

         Print(">>> Multi-symbol TF button clicked: ", sparam);

         // Extract symbol index and timeframe index from "SymMaster_Multi_X_TF_Y"
         int multiPos = StringFind(sparam, "SymMaster_Multi_");
         int tfPos = StringFind(sparam, "_TF_");

         string symIdxStr = StringSubstr(sparam, 16, tfPos - 16);  // After "SymMaster_Multi_"
         string tfIdxStr = StringSubstr(sparam, tfPos + 4);        // After "_TF_"

         int symIdx = (int)StringToInteger(symIdxStr);
         int tfIdx = (int)StringToInteger(tfIdxStr);

         Print(">>> Parsed: symIdx=", symIdx, " tfIdx=", tfIdx, " MultiSymbolCount=", g_MultiSymbolCount);

         if(symIdx >= 0 && symIdx < g_MultiSymbolCount && tfIdx >= 0 && tfIdx < g_ActiveTFCount)
         {
            Print(">>> Opening mini chart for symbol: ", g_MultiSymbols[symIdx], " TF: ", g_MultiTFAnalysis[symIdx][tfIdx].tfName);

            // Close any open mini chart
            if(g_ActiveMiniChart >= 0)
               CloseMiniChart();

            // Open mini chart for this symbol and timeframe
            g_ActiveMiniChart = tfIdx;  // Store which TF is active
            CreateMiniChart(g_MultiSymbols[symIdx], g_MultiTFAnalysis[symIdx][tfIdx].timeframe, g_MultiTFAnalysis[symIdx][tfIdx].tfName, g_MultiTFAnalysis[symIdx][tfIdx]);

            Print(">>> Mini chart created successfully!");
         }
         else
         {
            Print(">>> ERROR: Index out of bounds! symIdx=", symIdx, " tfIdx=", tfIdx);
         }
         return;
      }
      
      // Check if mini chart close button clicked
      if(sparam == "SymMaster_MiniClose")
      {
         // CRITICAL: Deselect button immediately
         ObjectSetInteger(0, "SymMaster_MiniClose", OBJPROP_STATE, false);

         Print(">>> Closing mini chart");
         CloseMiniChart();
         return;
      }
      
      // Style button clicks
      if(sparam == "SymMaster_StyleA")
      {
         // CRITICAL: Deselect button immediately
         ObjectSetInteger(0, "SymMaster_StyleA", OBJPROP_STATE, false);

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
         // CRITICAL: Deselect button immediately
         ObjectSetInteger(0, "SymMaster_StyleB", OBJPROP_STATE, false);

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
         // CRITICAL: Deselect button immediately
         ObjectSetInteger(0, "SymMaster_StyleC", OBJPROP_STATE, false);

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
         Print(">>> MODE TOGGLE CLICKED! Current mode: ", g_MultiSymbolMode ? "MULTI" : "SINGLE");

         // CRITICAL: Deselect the clicked object BEFORE deletion to avoid MT5 confusion
         ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_SELECTED, false);
         ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_STATE, false);

         // Toggle the mode
         g_MultiSymbolMode = !g_MultiSymbolMode;

         Print(">>> Switching to ", g_MultiSymbolMode ? "MULTI-SYMBOL" : "SINGLE-SYMBOL", " mode");

         // Delete ALL dashboard objects
         DeleteDashboard();

         // Recreate dashboard in new mode
         if(g_MultiSymbolMode)
         {
            // Initialize multi-symbol data if not already done
            if(g_MultiSymbolCount == 0)
            {
               Print(">>> Initializing multi-symbol data for runtime toggle...");

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

               Print(">>> Multi-Symbol Mode initialized with ", g_MultiSymbolCount, " symbols");
            }

            CreateDashboard();  // Create base dashboard first
            CreateMultiSymbolDashboards();  // Then add multi-symbol boxes

            // Perform analysis and update immediately
            PerformMultiSymbolAnalysis();
            UpdateMultiSymbolDashboards();
         }
         else
         {
            // SWITCHING TO SINGLE MODE - Release multi-symbol resources to save CPU/memory
            Print(">>> Releasing multi-symbol resources to optimize single-symbol mode");

            // Release all indicator handles for multi-symbols
            for(int symIdx = 0; symIdx < g_MultiSymbolCount; symIdx++)
            {
               for(int i = 0; i < g_ActiveTFCount; i++)
               {
                  if(g_MultiTrendMA_Handles[symIdx][i] != INVALID_HANDLE)
                  {
                     IndicatorRelease(g_MultiTrendMA_Handles[symIdx][i]);
                     g_MultiTrendMA_Handles[symIdx][i] = INVALID_HANDLE;
                  }
                  if(g_MultiATR_Handles[symIdx][i] != INVALID_HANDLE)
                  {
                     IndicatorRelease(g_MultiATR_Handles[symIdx][i]);
                     g_MultiATR_Handles[symIdx][i] = INVALID_HANDLE;
                  }
               }
            }

            // Reset multi-symbol count to free memory
            g_MultiSymbolCount = 0;
            Print(">>> Multi-symbol resources released. Single-symbol mode optimized.");

            CreateDashboard();  // Single symbol dashboard

            // Perform analysis and update immediately
            PerformMultiTimeframeAnalysis();
            UpdateDashboard();
         }

         // Update the toggle button text (already set by CreateDashboard, but update to be sure)
         ObjectSetString(0, "SymMaster_ModeToggle", OBJPROP_TEXT, g_MultiSymbolMode ? "🔄 SINGLE" : "🔄 MULTI");

         // Ensure toggle button is clickable
         ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_SELECTABLE, true);
         ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_SELECTED, false);
         ObjectSetInteger(0, "SymMaster_ModeToggleBG", OBJPROP_STATE, false);

         Print(">>> Mode switch COMPLETE. New mode: ", g_MultiSymbolMode ? "MULTI" : "SINGLE");
         Print(">>> Toggle button recreated and ready for next click");

         ChartRedraw();
         return;
      }

      // ========== FEATURE #10: TRADE PANEL BUTTON HANDLERS ==========
      // Check if EXECUTE button clicked
      if(sparam == "SymMaster_TradePanel_ExecuteBtn")
      {
         // Deselect button
         ObjectSetInteger(0, sparam, OBJPROP_STATE, false);

         Print(">>> EXECUTE BUTTON CLICKED - Executing trade...");

         if(g_TradeParamsActive)
         {
            bool success = ExecuteTrade(g_CurrentTradeParams);
            if(success)
            {
               Print(">>> Trade executed successfully!");
            }
            else
            {
               Print(">>> Trade execution failed!");
            }
         }
         else
         {
            Print(">>> ERROR: No active trade parameters!");
            HideTradePanel();
         }
         return;
      }

      // Check if SKIP button clicked
      if(sparam == "SymMaster_TradePanel_SkipBtn")
      {
         // Deselect button
         ObjectSetInteger(0, sparam, OBJPROP_STATE, false);

         Print(">>> SKIP BUTTON CLICKED - Trade skipped");
         HideTradePanel();
         return;
      }
      // ========== END FEATURE #10 ==========
   }
}

//+------------------------------------------------------------------+
//| FEATURE #1: DYNAMIC SL/TP CALCULATOR - IMPLEMENTATION            |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Calculate Dynamic Stop Loss                                      |
//+------------------------------------------------------------------+
double CalculateDynamicStopLoss(string symbol, ENUM_TIMEFRAMES timeframe, bool isBuy, double entryPrice)
{
   if(!EnableDynamicSLTP) return 0.0;

   double stopLoss = 0.0;
   double atrStopLoss = 0.0;
   double structureStopLoss = 0.0;

   // METHOD 1: ATR-based Stop Loss
   double atr[];
   ArraySetAsSeries(atr, true);
   int atrHandle = iATR(symbol, timeframe, 14);
   if(atrHandle != INVALID_HANDLE)
   {
      if(CopyBuffer(atrHandle, 0, 0, 1, atr) > 0)
      {
         double atrValue = atr[0];
         double atrDistance = atrValue * SLATRMultiplier;

         if(isBuy)
            atrStopLoss = entryPrice - atrDistance;
         else
            atrStopLoss = entryPrice + atrDistance;
      }
      IndicatorRelease(atrHandle);
   }

   // METHOD 2: Structure-based Stop Loss (swing high/low)
   double high[];
   double low[];
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);

   int lookback = SwingLookback;
   if(CopyHigh(symbol, timeframe, 0, lookback, high) > 0 &&
      CopyLow(symbol, timeframe, 0, lookback, low) > 0)
   {
      if(isBuy)
      {
         // Find recent swing low
         double swingLow = low[ArrayMinimum(low, 0, lookback)];
         double bufferPips = SLStructureBuffer * _Point * 10;  // Convert pips to price
         structureStopLoss = swingLow - bufferPips;
      }
      else
      {
         // Find recent swing high
         double swingHigh = high[ArrayMaximum(high, 0, lookback)];
         double bufferPips = SLStructureBuffer * _Point * 10;  // Convert pips to price
         structureStopLoss = swingHigh + bufferPips;
      }
   }

   // Use the tighter (closer to entry) stop loss if both are valid
   if(atrStopLoss > 0 && structureStopLoss > 0)
   {
      if(isBuy)
         stopLoss = MathMax(atrStopLoss, structureStopLoss);  // Tighter stop for BUY
      else
         stopLoss = MathMin(atrStopLoss, structureStopLoss);  // Tighter stop for SELL
   }
   else if(atrStopLoss > 0)
   {
      stopLoss = atrStopLoss;
   }
   else if(structureStopLoss > 0)
   {
      stopLoss = structureStopLoss;
   }
   else
   {
      // Fallback: Use fixed pip distance
      double fallbackPips = 50.0 * _Point * 10;
      stopLoss = isBuy ? (entryPrice - fallbackPips) : (entryPrice + fallbackPips);
   }

   return NormalizeDouble(stopLoss, _Digits);
}

//+------------------------------------------------------------------+
//| Calculate Multiple Take Profit Levels                            |
//+------------------------------------------------------------------+
void CalculateMultipleTakeProfits(TradeParameters &params)
{
   if(!EnableDynamicSLTP) return;

   double riskDistance = MathAbs(params.entryPrice - params.stopLoss);
   params.riskInPips = riskDistance / (_Point * 10);

   if(params.isBuy)
   {
      params.takeProfit1 = params.entryPrice + (riskDistance * TP1_RiskReward);
      params.takeProfit2 = params.entryPrice + (riskDistance * TP2_RiskReward);
      params.takeProfit3 = params.entryPrice + (riskDistance * TP3_RiskReward);
   }
   else
   {
      params.takeProfit1 = params.entryPrice - (riskDistance * TP1_RiskReward);
      params.takeProfit2 = params.entryPrice - (riskDistance * TP2_RiskReward);
      params.takeProfit3 = params.entryPrice - (riskDistance * TP3_RiskReward);
   }

   params.rewardInPips1 = MathAbs(params.takeProfit1 - params.entryPrice) / (_Point * 10);
   params.rewardInPips2 = MathAbs(params.takeProfit2 - params.entryPrice) / (_Point * 10);
   params.rewardInPips3 = MathAbs(params.takeProfit3 - params.entryPrice) / (_Point * 10);

   // Normalize to proper digits
   params.takeProfit1 = NormalizeDouble(params.takeProfit1, _Digits);
   params.takeProfit2 = NormalizeDouble(params.takeProfit2, _Digits);
   params.takeProfit3 = NormalizeDouble(params.takeProfit3, _Digits);
}

//+------------------------------------------------------------------+
//| Draw SL/TP Levels on Chart                                       |
//+------------------------------------------------------------------+
void DrawSLTPLevelsOnChart(TradeParameters &params)
{
   if(!EnableDynamicSLTP || !DrawSLTPLevels) return;

   string prefix = "SymMaster_SLTP_";

   // Clear old levels first
   ClearSLTPLevels();

   datetime currentTime = TimeCurrent();
   datetime futureTime = currentTime + PeriodSeconds(PERIOD_H4);  // Extend 4 hours into future

   // Draw Entry Level
   string entryName = prefix + "Entry";
   ObjectCreate(0, entryName, OBJ_TREND, 0, currentTime, params.entryPrice, futureTime, params.entryPrice);
   ObjectSetInteger(0, entryName, OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, entryName, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, entryName, OBJPROP_STYLE, STYLE_SOLID);
   ObjectSetInteger(0, entryName, OBJPROP_RAY_RIGHT, true);
   ObjectSetInteger(0, entryName, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, entryName, OBJPROP_BACK, false);
   ObjectSetString(0, entryName, OBJPROP_TEXT, "Entry: " + DoubleToString(params.entryPrice, _Digits));

   // Draw Stop Loss
   string slName = prefix + "SL";
   ObjectCreate(0, slName, OBJ_TREND, 0, currentTime, params.stopLoss, futureTime, params.stopLoss);
   ObjectSetInteger(0, slName, OBJPROP_COLOR, SLColor);
   ObjectSetInteger(0, slName, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, slName, OBJPROP_STYLE, STYLE_SOLID);
   ObjectSetInteger(0, slName, OBJPROP_RAY_RIGHT, true);
   ObjectSetInteger(0, slName, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, slName, OBJPROP_BACK, false);
   ObjectSetString(0, slName, OBJPROP_TEXT, "SL: " + DoubleToString(params.stopLoss, _Digits) + " (-" + DoubleToString(params.riskInPips, 1) + " pips)");

   // Draw Take Profit 1
   string tp1Name = prefix + "TP1";
   ObjectCreate(0, tp1Name, OBJ_TREND, 0, currentTime, params.takeProfit1, futureTime, params.takeProfit1);
   ObjectSetInteger(0, tp1Name, OBJPROP_COLOR, TP1Color);
   ObjectSetInteger(0, tp1Name, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, tp1Name, OBJPROP_STYLE, STYLE_DOT);
   ObjectSetInteger(0, tp1Name, OBJPROP_RAY_RIGHT, true);
   ObjectSetInteger(0, tp1Name, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, tp1Name, OBJPROP_BACK, false);
   ObjectSetString(0, tp1Name, OBJPROP_TEXT, "TP1: " + DoubleToString(params.takeProfit1, _Digits) + " (+" + DoubleToString(params.rewardInPips1, 1) + " pips | " + DoubleToString(TP1_RiskReward, 1) + "R)");

   // Draw Take Profit 2
   string tp2Name = prefix + "TP2";
   ObjectCreate(0, tp2Name, OBJ_TREND, 0, currentTime, params.takeProfit2, futureTime, params.takeProfit2);
   ObjectSetInteger(0, tp2Name, OBJPROP_COLOR, TP2Color);
   ObjectSetInteger(0, tp2Name, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, tp2Name, OBJPROP_STYLE, STYLE_DOT);
   ObjectSetInteger(0, tp2Name, OBJPROP_RAY_RIGHT, true);
   ObjectSetInteger(0, tp2Name, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, tp2Name, OBJPROP_BACK, false);
   ObjectSetString(0, tp2Name, OBJPROP_TEXT, "TP2: " + DoubleToString(params.takeProfit2, _Digits) + " (+" + DoubleToString(params.rewardInPips2, 1) + " pips | " + DoubleToString(TP2_RiskReward, 1) + "R)");

   // Draw Take Profit 3
   string tp3Name = prefix + "TP3";
   ObjectCreate(0, tp3Name, OBJ_TREND, 0, currentTime, params.takeProfit3, futureTime, params.takeProfit3);
   ObjectSetInteger(0, tp3Name, OBJPROP_COLOR, TP3Color);
   ObjectSetInteger(0, tp3Name, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, tp3Name, OBJPROP_STYLE, STYLE_DOT);
   ObjectSetInteger(0, tp3Name, OBJPROP_RAY_RIGHT, true);
   ObjectSetInteger(0, tp3Name, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, tp3Name, OBJPROP_BACK, false);
   ObjectSetString(0, tp3Name, OBJPROP_TEXT, "TP3: " + DoubleToString(params.takeProfit3, _Digits) + " (+" + DoubleToString(params.rewardInPips3, 1) + " pips | " + DoubleToString(TP3_RiskReward, 1) + "R)");

   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Clear SL/TP Levels from Chart                                    |
//+------------------------------------------------------------------+
void ClearSLTPLevels()
{
   string prefix = "SymMaster_SLTP_";
   ObjectDelete(0, prefix + "Entry");
   ObjectDelete(0, prefix + "SL");
   ObjectDelete(0, prefix + "TP1");
   ObjectDelete(0, prefix + "TP2");
   ObjectDelete(0, prefix + "TP3");
}

//+------------------------------------------------------------------+
//| FEATURE #2: POSITION SIZE CALCULATOR - IMPLEMENTATION            |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Calculate Position Size Based on Risk                            |
//+------------------------------------------------------------------+
double CalculatePositionSize(string symbol, double entryPrice, double stopLoss, double riskPercent)
{
   if(!EnablePositionSizing || !AutoCalculateLotSize) return MinLotSize;

   // Get account balance
   double accountBalance = AccountInfoDouble(ACCOUNT_BALANCE);
   if(accountBalance <= 0) return MinLotSize;

   // Calculate risk amount in account currency
   double riskAmount = accountBalance * (riskPercent / 100.0);

   // Calculate stop loss distance in pips
   double slDistance = MathAbs(entryPrice - stopLoss);
   if(slDistance <= 0) return MinLotSize;

   // Get symbol specifications
   double tickSize = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE);
   double tickValue = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
   double lotStep = SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);

   if(tickSize <= 0 || tickValue <= 0) return MinLotSize;

   // Calculate pip value per lot
   double pipValue = (tickValue / tickSize) * _Point;

   // Calculate required lot size
   double slPips = slDistance / _Point;
   double lotSize = riskAmount / (slPips * pipValue);

   // Round to lot step
   lotSize = MathFloor(lotSize / lotStep) * lotStep;

   // Apply min/max constraints
   lotSize = MathMax(lotSize, MinLotSize);
   lotSize = MathMin(lotSize, MaxLotSize);

   // Check broker limits
   double minLot = SymbolInfoDouble(symbol, SYMBOL_VOLUME_MIN);
   double maxLot = SymbolInfoDouble(symbol, SYMBOL_VOLUME_MAX);
   lotSize = MathMax(lotSize, minLot);
   lotSize = MathMin(lotSize, maxLot);

   return NormalizeDouble(lotSize, 2);
}

//+------------------------------------------------------------------+
//| Get Daily Risk Already Used                                      |
//+------------------------------------------------------------------+
double GetDailyRiskUsed()
{
   if(!EnablePositionSizing) return 0.0;

   double totalRiskUsed = 0.0;
   datetime todayStart = StringToTime(TimeToString(TimeCurrent(), TIME_DATE));

   // Count open positions from today
   int totalPositions = PositionsTotal();
   for(int i = 0; i < totalPositions; i++)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0)
      {
         datetime openTime = (datetime)PositionGetInteger(POSITION_TIME);
         if(openTime >= todayStart)
         {
            double positionVolume = PositionGetDouble(POSITION_VOLUME);
            double openPrice = PositionGetDouble(POSITION_PRICE_OPEN);
            double sl = PositionGetDouble(POSITION_SL);

            if(sl > 0)
            {
               double slDistance = MathAbs(openPrice - sl);
               double slPips = slDistance / _Point;

               // Estimate risk for this position
               double tickValue = SymbolInfoDouble(PositionGetString(POSITION_SYMBOL), SYMBOL_TRADE_TICK_VALUE);
               double riskAmount = slPips * tickValue * positionVolume;

               double accountBalance = AccountInfoDouble(ACCOUNT_BALANCE);
               if(accountBalance > 0)
               {
                  double riskPercent = (riskAmount / accountBalance) * 100.0;
                  totalRiskUsed += riskPercent;
               }
            }
         }
      }
   }

   return totalRiskUsed;
}

//+------------------------------------------------------------------+
//| Check if Daily Risk Limit Exceeded                               |
//+------------------------------------------------------------------+
bool IsDailyRiskLimitExceeded(double additionalRiskPercent)
{
   if(!EnablePositionSizing) return false;

   double currentRiskUsed = GetDailyRiskUsed();
   double totalRisk = currentRiskUsed + additionalRiskPercent;

   if(totalRisk > MaxDailyRiskPercent)
   {
      Print(">>> DAILY RISK LIMIT EXCEEDED! Current: ", DoubleToString(currentRiskUsed, 2),
            "% | Requested: ", DoubleToString(additionalRiskPercent, 2),
            "% | Total: ", DoubleToString(totalRisk, 2),
            "% | Max Allowed: ", DoubleToString(MaxDailyRiskPercent, 2), "%");
      return true;
   }

   return false;
}

//+------------------------------------------------------------------+
//| FEATURE #10: ONE-CLICK TRADE PANEL - IMPLEMENTATION              |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Create Trade Panel UI                                            |
//+------------------------------------------------------------------+
void CreateTradePanel(TradeParameters &params)
{
   if(!EnableTradePanel) return;

   string prefix = "SymMaster_TradePanel_";

   // Clear old panel first
   HideTradePanel();

   int panelWidth = 300;
   int panelHeight = 280;
   int xPos = TradePanelXPos;
   int yPos = TradePanelYPos;

   // Main panel background
   ObjectCreate(0, prefix + "BG", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_XDISTANCE, xPos);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_YDISTANCE, yPos);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_XSIZE, panelWidth);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_YSIZE, panelHeight);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_BGCOLOR, TradePanelBackground);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_BORDER_TYPE, BORDER_FLAT);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_COLOR, TradePanelBorder);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, prefix + "BG", OBJPROP_BACK, false);

   // Title
   ObjectCreate(0, prefix + "Title", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "Title", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "Title", OBJPROP_YDISTANCE, yPos + 10);
   ObjectSetInteger(0, prefix + "Title", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "Title", OBJPROP_TEXT, "🚀 TRADE EXECUTION PANEL");
   ObjectSetInteger(0, prefix + "Title", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, prefix + "Title", OBJPROP_FONTSIZE, 11);
   ObjectSetString(0, prefix + "Title", OBJPROP_FONT, "Arial Bold");

   // Signal info
   string direction = params.isBuy ? "🟢 BUY" : "🔴 SELL";
   ObjectCreate(0, prefix + "Direction", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "Direction", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "Direction", OBJPROP_YDISTANCE, yPos + 35);
   ObjectSetInteger(0, prefix + "Direction", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "Direction", OBJPROP_TEXT, "Direction: " + direction);
   ObjectSetInteger(0, prefix + "Direction", OBJPROP_COLOR, params.isBuy ? clrLime : clrRed);
   ObjectSetInteger(0, prefix + "Direction", OBJPROP_FONTSIZE, 10);

   // Symbol
   ObjectCreate(0, prefix + "Symbol", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "Symbol", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "Symbol", OBJPROP_YDISTANCE, yPos + 55);
   ObjectSetInteger(0, prefix + "Symbol", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "Symbol", OBJPROP_TEXT, "Symbol: " + params.symbol);
   ObjectSetInteger(0, prefix + "Symbol", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, prefix + "Symbol", OBJPROP_FONTSIZE, 9);

   // Entry Price
   ObjectCreate(0, prefix + "Entry", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "Entry", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "Entry", OBJPROP_YDISTANCE, yPos + 75);
   ObjectSetInteger(0, prefix + "Entry", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "Entry", OBJPROP_TEXT, "Entry: " + DoubleToString(params.entryPrice, _Digits));
   ObjectSetInteger(0, prefix + "Entry", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, prefix + "Entry", OBJPROP_FONTSIZE, 9);

   // Stop Loss
   ObjectCreate(0, prefix + "SL", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "SL", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "SL", OBJPROP_YDISTANCE, yPos + 95);
   ObjectSetInteger(0, prefix + "SL", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "SL", OBJPROP_TEXT, "SL: " + DoubleToString(params.stopLoss, _Digits) + " (-" + DoubleToString(params.riskInPips, 1) + " pips)");
   ObjectSetInteger(0, prefix + "SL", OBJPROP_COLOR, clrRed);
   ObjectSetInteger(0, prefix + "SL", OBJPROP_FONTSIZE, 9);

   // Take Profit 1
   ObjectCreate(0, prefix + "TP1", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "TP1", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "TP1", OBJPROP_YDISTANCE, yPos + 115);
   ObjectSetInteger(0, prefix + "TP1", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "TP1", OBJPROP_TEXT, "TP1: " + DoubleToString(params.takeProfit1, _Digits) + " (+" + DoubleToString(params.rewardInPips1, 1) + " pips | " + DoubleToString(TP1_RiskReward, 1) + "R)");
   ObjectSetInteger(0, prefix + "TP1", OBJPROP_COLOR, clrLime);
   ObjectSetInteger(0, prefix + "TP1", OBJPROP_FONTSIZE, 8);

   // Take Profit 2
   ObjectCreate(0, prefix + "TP2", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "TP2", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "TP2", OBJPROP_YDISTANCE, yPos + 135);
   ObjectSetInteger(0, prefix + "TP2", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "TP2", OBJPROP_TEXT, "TP2: " + DoubleToString(params.takeProfit2, _Digits) + " (+" + DoubleToString(params.rewardInPips2, 1) + " pips | " + DoubleToString(TP2_RiskReward, 1) + "R)");
   ObjectSetInteger(0, prefix + "TP2", OBJPROP_COLOR, clrGold);
   ObjectSetInteger(0, prefix + "TP2", OBJPROP_FONTSIZE, 8);

   // Take Profit 3
   ObjectCreate(0, prefix + "TP3", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "TP3", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "TP3", OBJPROP_YDISTANCE, yPos + 155);
   ObjectSetInteger(0, prefix + "TP3", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "TP3", OBJPROP_TEXT, "TP3: " + DoubleToString(params.takeProfit3, _Digits) + " (+" + DoubleToString(params.rewardInPips3, 1) + " pips | " + DoubleToString(TP3_RiskReward, 1) + "R)");
   ObjectSetInteger(0, prefix + "TP3", OBJPROP_COLOR, clrDodgerBlue);
   ObjectSetInteger(0, prefix + "TP3", OBJPROP_FONTSIZE, 8);

   // Lot Size
   ObjectCreate(0, prefix + "LotSize", OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, prefix + "LotSize", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "LotSize", OBJPROP_YDISTANCE, yPos + 180);
   ObjectSetInteger(0, prefix + "LotSize", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "LotSize", OBJPROP_TEXT, "Lot Size: " + DoubleToString(params.lotSize, 2) + " lots (" + DoubleToString(RiskPercentPerTrade, 1) + "% risk)");
   ObjectSetInteger(0, prefix + "LotSize", OBJPROP_COLOR, clrYellow);
   ObjectSetInteger(0, prefix + "LotSize", OBJPROP_FONTSIZE, 9);

   // EXECUTE Button
   ObjectCreate(0, prefix + "ExecuteBtn", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_XDISTANCE, xPos + 10);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_YDISTANCE, yPos + 210);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_XSIZE, 130);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_YSIZE, 40);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "ExecuteBtn", OBJPROP_TEXT, "✅ EXECUTE");
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_BGCOLOR, ExecuteButtonColor);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_FONTSIZE, 11);
   ObjectSetInteger(0, prefix + "ExecuteBtn", OBJPROP_STATE, false);

   // SKIP Button
   ObjectCreate(0, prefix + "SkipBtn", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_XDISTANCE, xPos + 150);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_YDISTANCE, yPos + 210);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_XSIZE, 130);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_YSIZE, 40);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, prefix + "SkipBtn", OBJPROP_TEXT, "❌ SKIP");
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_BGCOLOR, SkipButtonColor);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_FONTSIZE, 11);
   ObjectSetInteger(0, prefix + "SkipBtn", OBJPROP_STATE, false);

   g_TradePanelVisible = true;
   ChartRedraw();
}

//+------------------------------------------------------------------+
//| Hide Trade Panel                                                 |
//+------------------------------------------------------------------+
void HideTradePanel()
{
   string prefix = "SymMaster_TradePanel_";

   ObjectDelete(0, prefix + "BG");
   ObjectDelete(0, prefix + "Title");
   ObjectDelete(0, prefix + "Direction");
   ObjectDelete(0, prefix + "Symbol");
   ObjectDelete(0, prefix + "Entry");
   ObjectDelete(0, prefix + "SL");
   ObjectDelete(0, prefix + "TP1");
   ObjectDelete(0, prefix + "TP2");
   ObjectDelete(0, prefix + "TP3");
   ObjectDelete(0, prefix + "LotSize");
   ObjectDelete(0, prefix + "ExecuteBtn");
   ObjectDelete(0, prefix + "SkipBtn");

   g_TradePanelVisible = false;
}

//+------------------------------------------------------------------+
//| Execute Trade                                                    |
//+------------------------------------------------------------------+
bool ExecuteTrade(TradeParameters &params)
{
   if(!EnableTradePanel) return false;

   MqlTradeRequest request;
   MqlTradeResult result;
   ZeroMemory(request);
   ZeroMemory(result);

   // Build trade request
   request.action = TRADE_ACTION_DEAL;
   request.symbol = params.symbol;
   request.volume = params.lotSize;
   request.type = params.isBuy ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
   request.price = params.isBuy ? SymbolInfoDouble(params.symbol, SYMBOL_ASK) : SymbolInfoDouble(params.symbol, SYMBOL_BID);
   request.sl = params.stopLoss;
   request.tp = params.takeProfit1;  // Set TP1 initially
   request.deviation = 10;
   request.magic = 123456;  // Magic number for identification
   request.comment = "SymbolMasterPro";
   request.type_filling = ORDER_FILLING_FOK;

   // Try to send order
   bool success = OrderSend(request, result);

   if(success && result.retcode == TRADE_RETCODE_DONE)
   {
      Print(">>> TRADE EXECUTED SUCCESSFULLY!");
      Print(">>> Ticket: ", result.order);
      Print(">>> Symbol: ", params.symbol);
      Print(">>> Direction: ", params.isBuy ? "BUY" : "SELL");
      Print(">>> Lot Size: ", DoubleToString(params.lotSize, 2));
      Print(">>> Entry: ", DoubleToString(request.price, _Digits));
      Print(">>> SL: ", DoubleToString(params.stopLoss, _Digits));
      Print(">>> TP1: ", DoubleToString(params.takeProfit1, _Digits));

      // Play sound if enabled
      if(PlaySoundOnTradeExecution)
      {
         PlaySound("alert.wav");
      }

      // Show alert if enabled
      if(AlertOnTradeExecution)
      {
         Alert("✅ TRADE EXECUTED: ", params.isBuy ? "BUY" : "SELL", " ", params.symbol,
               " | Lot: ", DoubleToString(params.lotSize, 2),
               " | Entry: ", DoubleToString(request.price, _Digits));
      }

      HideTradePanel();
      return true;
   }
   else
   {
      Print(">>> TRADE EXECUTION FAILED!");
      Print(">>> Error Code: ", result.retcode);
      Print(">>> Error Description: ", result.comment);

      Alert("❌ TRADE FAILED: ", result.comment);
      return false;
   }
}

//+------------------------------------------------------------------+
//| PHASE 2: SESSION + VOLATILITY + HTF FILTERS - IMPLEMENTATION     |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| FEATURE #4: Check if Current Session is Allowed                  |
//+------------------------------------------------------------------+
bool IsSessionAllowed()
{
   if(!EnableSessionFilter) return true;

   MqlDateTime dt;
   TimeToStruct(TimeGMT(), dt);
   int hourGMT = dt.hour;

   g_CurrentSession = "NONE";

   // London Session: 07:00-16:00 GMT
   bool isLondon = (hourGMT >= 7 && hourGMT < 16);

   // NY Session: 12:00-21:00 GMT
   bool isNY = (hourGMT >= 12 && hourGMT < 21);

   // Asian Session: 00:00-09:00 GMT
   bool isAsian = (hourGMT >= 0 && hourGMT < 9);

   // London/NY Overlap: 12:00-16:00 GMT
   bool isOverlap = (hourGMT >= 12 && hourGMT < 16);

   // Determine current session
   if(isOverlap) g_CurrentSession = "OVERLAP";
   else if(isLondon) g_CurrentSession = "LONDON";
   else if(isNY) g_CurrentSession = "NY";
   else if(isAsian) g_CurrentSession = "ASIAN";

   // Check if overlap is required
   if(RequireLondonNYOverlap)
   {
      return isOverlap;
   }

   // Check allowed sessions
   if(TradeLondonSession && isLondon) return true;
   if(TradeNYSession && isNY) return true;
   if(TradeAsianSession && isAsian) return true;

   return false;
}

//+------------------------------------------------------------------+
//| FEATURE #6: Check Volatility Filter (ADX + ATR)                  |
//+------------------------------------------------------------------+
bool PassesVolatilityFilter(ENUM_TIMEFRAMES timeframe)
{
   if(!EnableVolatilityFilter) return true;

   // Get ADX
   double adx[];
   ArraySetAsSeries(adx, true);

   int adxHandle = iADX(g_Symbol, timeframe, 14);
   if(adxHandle == INVALID_HANDLE) return true;  // Pass if can't calculate

   if(CopyBuffer(adxHandle, 0, 0, 1, adx) > 0)
   {
      double adxValue = adx[0];

      if(adxValue < MinADXValue || adxValue > MaxADXValue)
      {
         IndicatorRelease(adxHandle);
         Print(">>> VOLATILITY FILTER FAILED: ADX=", DoubleToString(adxValue, 1), " (Range: ", MinADXValue, "-", MaxADXValue, ")");
         return false;
      }
   }
   IndicatorRelease(adxHandle);

   // Get ATR ratio
   double atr[];
   ArraySetAsSeries(atr, true);

   int atrHandle = iATR(g_Symbol, timeframe, 14);
   if(atrHandle == INVALID_HANDLE) return true;

   if(CopyBuffer(atrHandle, 0, 0, 50, atr) > 0)
   {
      double currentATR = atr[0];
      double avgATR = 0;
      for(int i = 0; i < 50; i++) avgATR += atr[i];
      avgATR /= 50;

      double atrRatio = avgATR > 0 ? (currentATR / avgATR) : 1.0;

      if(atrRatio < MinATRRatio || atrRatio > MaxATRRatio)
      {
         IndicatorRelease(atrHandle);
         Print(">>> VOLATILITY FILTER FAILED: ATR Ratio=", DoubleToString(atrRatio, 2), " (Range: ", MinATRRatio, "-", MaxATRRatio, ")");
         return false;
      }
   }
   IndicatorRelease(atrHandle);

   return true;
}

//+------------------------------------------------------------------+
//| FEATURE #7: Check Higher Timeframe Trend Alignment               |
//+------------------------------------------------------------------+
bool PassesHTFTrendFilter(bool isBuySignal)
{
   if(!EnableHTFTrendFilter) return true;

   int htfAligned = 0;
   int htfTotal = 0;

   // Check H4 if required
   if(RequireH4Alignment)
   {
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         if(g_TFAnalysis[i].timeframe == PERIOD_H4)
         {
            htfTotal++;
            if((isBuySignal && g_TFAnalysis[i].isBullish) || (!isBuySignal && g_TFAnalysis[i].isBearish))
            {
               htfAligned++;
            }
            break;
         }
      }
   }

   // Check D1 if required
   if(RequireD1Alignment)
   {
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         if(g_TFAnalysis[i].timeframe == PERIOD_D1)
         {
            htfTotal++;
            if((isBuySignal && g_TFAnalysis[i].isBullish) || (!isBuySignal && g_TFAnalysis[i].isBearish))
            {
               htfAligned++;
            }
            break;
         }
      }
   }

   // If require all TFs aligned
   if(RequireAllTFsAligned && htfAligned < htfTotal)
   {
      Print(">>> HTF TREND FILTER FAILED: ", htfAligned, "/", htfTotal, " HTFs aligned");
      return false;
   }

   // Check minimum HTF confidence (out of 10)
   int confidence = htfTotal > 0 ? (int)((double)htfAligned / (double)htfTotal * 10.0) : 10;
   if(confidence < MinHTFConfidence)
   {
      Print(">>> HTF TREND FILTER FAILED: Confidence=", confidence, "/10 (Min: ", MinHTFConfidence, ")");
      return false;
   }

   return true;
}

//+------------------------------------------------------------------+
//| PHASE 3: S/R + TRAILING + PERFORMANCE - IMPLEMENTATION           |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| FEATURE #8: Check Support/Resistance Confluence                  |
//+------------------------------------------------------------------+
bool IsNearSupportResistance(double price, bool isBuySignal)
{
   if(!EnableSRDetection) return true;  // Pass if disabled
   if(!RequireSRConfluence) return true;  // Pass if not required

   double zonePips = SRZoneThicknessPips * _Point * 10;
   bool nearSR = false;

   // Check swing points
   if(DetectSwingPoints)
   {
      double high[], low[];
      ArraySetAsSeries(high, true);
      ArraySetAsSeries(low, true);

      if(CopyHigh(g_Symbol, PERIOD_H4, 0, SRLookbackBars, high) > 0 &&
         CopyLow(g_Symbol, PERIOD_H4, 0, SRLookbackBars, low) > 0)
      {
         for(int i = 5; i < SRLookbackBars - 5; i++)
         {
            // Check swing high (resistance)
            if(high[i] > high[i-1] && high[i] > high[i+1] && high[i] > high[i-2] && high[i] > high[i+2])
            {
               if(MathAbs(price - high[i]) <= zonePips)
               {
                  if(isBuySignal) nearSR = true;  // BUY near resistance = good
               }
            }

            // Check swing low (support)
            if(low[i] < low[i-1] && low[i] < low[i+1] && low[i] < low[i-2] && low[i] < low[i+2])
            {
               if(MathAbs(price - low[i]) <= zonePips)
               {
                  if(!isBuySignal) nearSR = true;  // SELL near support = good
               }
            }
         }
      }
   }

   // Check round numbers
   if(DetectRoundNumbers)
   {
      double digits = _Digits == 3 || _Digits == 5 ? 3 : 2;
      double roundLevel = MathRound(price * MathPow(10, digits - 2)) / MathPow(10, digits - 2);

      if(MathAbs(price - roundLevel) <= zonePips)
      {
         nearSR = true;
      }
   }

   return nearSR;
}

//+------------------------------------------------------------------+
//| FEATURE #3: Update Performance Statistics                        |
//+------------------------------------------------------------------+
void UpdatePerformanceStats(bool signalWon)
{
   if(!EnablePerformanceTracking) return;

   g_TotalSignals++;

   if(signalWon)
      g_WinningSignals++;
   else
      g_LosingSignals++;

   double winRate = g_TotalSignals > 0 ? ((double)g_WinningSignals / (double)g_TotalSignals * 100.0) : 0.0;

   Print(">>> PERFORMANCE UPDATE: Win Rate = ", DoubleToString(winRate, 1), "% (", g_WinningSignals, "W / ", g_LosingSignals, "L / ", g_TotalSignals, " Total)");
}

//+------------------------------------------------------------------+
//| PHASE 4: NEWS BLOCKER - IMPLEMENTATION                           |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| FEATURE #5: Check if News Event is Near                          |
//+------------------------------------------------------------------+
bool IsNewsEventNear()
{
   if(!EnableNewsFilter) return false;

   // Simple time-based news blocker
   // Blocks trading during typical high-impact news times
   MqlDateTime dt;
   TimeToStruct(TimeGMT(), dt);
   int hourGMT = dt.hour;
   int minuteGMT = dt.min;
   int totalMinutes = hourGMT * 60 + minuteGMT;

   // Common high-impact news times (GMT)
   // 08:30 GMT (US Economic Data)
   // 12:30 GMT (US Economic Data)
   // 14:00 GMT (Fed Announcements)
   // 18:00 GMT (FOMC Minutes)

   int newsTime830 = 8 * 60 + 30;
   int newsTime1230 = 12 * 60 + 30;
   int newsTime1400 = 14 * 60;
   int newsTime1800 = 18 * 60;

   int buffer = NewsBufferMinutesBefore + NewsBufferMinutesAfter;

   // Check if near any news time
   if(MathAbs(totalMinutes - newsTime830) <= buffer) return true;
   if(MathAbs(totalMinutes - newsTime1230) <= buffer) return true;
   if(MathAbs(totalMinutes - newsTime1400) <= buffer) return true;
   if(MathAbs(totalMinutes - newsTime1800) <= buffer) return true;

   return false;
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

      // ========== FEATURE #1: DYNAMIC SL/TP CALCULATOR ==========
      if(EnableDynamicSLTP)
      {
         // Use dynamic SL/TP calculation
         ENUM_TIMEFRAMES signalTimeframe = g_Timeframes[0];  // Use primary timeframe
         if(g_ActiveTFCount > 2) signalTimeframe = g_Timeframes[g_ActiveTFCount / 2];  // Use mid-range TF

         // Calculate dynamic stop loss
         double dynamicSL = CalculateDynamicStopLoss(g_Symbol, signalTimeframe, isBuySignal, currentPrice);

         if(dynamicSL > 0)
         {
            g_CurrentSignal.stopLoss = dynamicSL;
         }
         else
         {
            // Fallback to fixed pip SL if dynamic calculation fails
            g_CurrentSignal.stopLoss = isBuySignal ?
               (currentPrice - (StopLossPips * point * 10)) :
               (currentPrice + (StopLossPips * point * 10));
         }

         // Build trade parameters for TP calculation
         g_CurrentTradeParams.symbol = g_Symbol;
         g_CurrentTradeParams.entryPrice = currentPrice;
         g_CurrentTradeParams.stopLoss = g_CurrentSignal.stopLoss;
         g_CurrentTradeParams.isBuy = isBuySignal;

         // Calculate multiple take profit levels
         CalculateMultipleTakeProfits(g_CurrentTradeParams);

         // Store TP1 in signal structure (for compatibility with existing code)
         g_CurrentSignal.takeProfit = g_CurrentTradeParams.takeProfit1;

         // Calculate R:R based on TP3 (maximum target)
         double riskDistance = MathAbs(currentPrice - g_CurrentSignal.stopLoss);
         double rewardDistance = MathAbs(g_CurrentTradeParams.takeProfit3 - currentPrice);
         g_CurrentSignal.riskReward = riskDistance > 0 ? (rewardDistance / riskDistance) : TP3_RiskReward;

         // Mark trade params as active
         g_TradeParamsActive = true;

         // Draw SL/TP levels on chart
         if(DrawSLTPLevels)
         {
            DrawSLTPLevelsOnChart(g_CurrentTradeParams);
         }

         // ========== FEATURE #2: POSITION SIZE CALCULATOR ==========
         if(EnablePositionSizing && AutoCalculateLotSize)
         {
            // Check daily risk limit
            if(!IsDailyRiskLimitExceeded(RiskPercentPerTrade))
            {
               // Calculate position size
               double lotSize = CalculatePositionSize(g_Symbol, currentPrice, g_CurrentSignal.stopLoss, RiskPercentPerTrade);
               g_CurrentTradeParams.lotSize = lotSize;

               Print(">>> POSITION SIZE CALCULATED: ", DoubleToString(lotSize, 2), " lots | Risk: ",
                     DoubleToString(RiskPercentPerTrade, 2), "% | SL Distance: ",
                     DoubleToString(g_CurrentTradeParams.riskInPips, 1), " pips");
            }
            else
            {
               // Daily risk limit exceeded - block this trade
               Print(">>> TRADE BLOCKED: Daily risk limit of ", DoubleToString(MaxDailyRiskPercent, 2), "% exceeded!");
               g_SignalActive = false;
               return;
            }
         }
         else
         {
            // Use minimum lot size if auto-sizing is disabled
            g_CurrentTradeParams.lotSize = MinLotSize;
         }
         // ========== END FEATURE #2 ==========
      }
      else
      {
         // Use fixed pip calculation (original method)
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

         // Set default lot size for non-dynamic mode
         g_CurrentTradeParams.lotSize = MinLotSize;
      }
      // ========== END FEATURE #1 ==========

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

      // ========== FEATURE #10: TRADE PANEL TRIGGER ==========
      if(EnableTradePanel && g_TradeParamsActive)
      {
         if(AutoExecuteTrades)
         {
            // Auto-execute without confirmation
            Print(">>> AUTO-EXECUTE MODE: Executing trade immediately...");
            ExecuteTrade(g_CurrentTradeParams);
         }
         else if(ShowTradePanelOnSignal)
         {
            // Show trade panel for manual confirmation
            Print(">>> Showing Trade Panel for confirmation...");
            CreateTradePanel(g_CurrentTradeParams);
            g_TradePanelSignalTime = g_CurrentSignal.time;
         }
      }
      // ========== END FEATURE #10 ==========

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
//| Apply Edge Filters (ENHANCED WITH ALL PHASES 2-4)                |
//+------------------------------------------------------------------+
bool ApplyEdgeFilters(bool isBuy, int weightedScore)
{
   Print(">>> APPLYING ALL FILTERS...");

   // ===== PHASE 4: NEWS FILTER =====
   if(IsNewsEventNear())
   {
      Print(">>> ❌ FILTER FAILED: News Event Near");
      return false;
   }

   // ===== PHASE 2: SESSION FILTER =====
   if(!IsSessionAllowed())
   {
      Print(">>> ❌ FILTER FAILED: Outside Allowed Trading Session (Current: ", g_CurrentSession, ")");
      return false;
   }

   // ===== PHASE 2: VOLATILITY FILTER =====
   ENUM_TIMEFRAMES filterTF = PERIOD_H1;  // Use H1 for filter checks
   for(int i = 0; i < g_ActiveTFCount; i++)
   {
      if(g_TFAnalysis[i].timeframe == PERIOD_H1)
      {
         filterTF = PERIOD_H1;
         break;
      }
   }

   if(!PassesVolatilityFilter(filterTF))
   {
      Print(">>> ❌ FILTER FAILED: Volatility Out of Range");
      return false;
   }

   // ===== PHASE 2: HTF TREND FILTER =====
   if(!PassesHTFTrendFilter(isBuy))
   {
      Print(">>> ❌ FILTER FAILED: Higher Timeframe Trend Not Aligned");
      return false;
   }

   // ===== PHASE 3: S/R CONFLUENCE CHECK =====
   double currentPrice = SymbolInfoDouble(g_Symbol, SYMBOL_BID);
   if(!IsNearSupportResistance(currentPrice, isBuy))
   {
      if(RequireSRConfluence)
      {
         Print(">>> ❌ FILTER FAILED: No Support/Resistance Confluence");
         return false;
      }
   }

   // ===== ORIGINAL FILTERS (Kept for backward compatibility) =====

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
      {
         Print(">>> ❌ FILTER FAILED: HTF Bias Against Signal");
         return false;
      }
      if(h4Bias != 0 && h4Bias != requiredBias)
      {
         Print(">>> ❌ FILTER FAILED: H4 Bias Against Signal");
         return false;
      }
   }

   // Filter 2: Volatility Filter using ATR (Original)
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
               {
                  Print(">>> ❌ FILTER FAILED: Original ATR Filter (Ratio: ", DoubleToString(atrRatio, 2), ")");
                  return false;
               }
            }
            break;
         }
      }
   }

   // Filter 3: Liquidity Sweep Confirmation
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
         {
            Print(">>> ❌ FILTER FAILED: No Liquidity Sweep");
            return false;
         }
      }
   }

   Print(">>> ✅ ALL FILTERS PASSED!");
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

      // Timeframe rows (compact layout) - CLICKABLE BUTTONS for mini charts
      int tfY = boxY + 30;
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         ObjectCreate(0, basePrefix + "_TF_" + IntegerToString(i), OBJ_BUTTON, 0, 0, 0);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_XDISTANCE, boxX + 5);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_YDISTANCE, tfY + (i * 17));
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_XSIZE, compactWidth - 10);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_YSIZE, 15);
         ObjectSetString(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_TEXT, "M1: ◯ NEUTRAL");
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_COLOR, clrWhite);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_BGCOLOR, clrDarkSlateGray);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_BORDER_COLOR, clrGray);
         ObjectSetInteger(0, basePrefix + "_TF_" + IntegerToString(i), OBJPROP_FONTSIZE, 7);
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

      // Update each timeframe display (now buttons)
      for(int i = 0; i < g_ActiveTFCount; i++)
      {
         string objName = basePrefix + "_TF_" + IntegerToString(i);
         TimeframeAnalysis tf = g_MultiTFAnalysis[symIdx][i];

         string biasText = "";
         color textColor = clrWhite;
         color bgColor = clrDarkSlateGray;

         if(tf.bias == 1)
         {
            biasText = "🟢 B";
            textColor = clrWhite;
            bgColor = clrDarkGreen;
         }
         else if(tf.bias == -1)
         {
            biasText = "🔴 B";
            textColor = clrWhite;
            bgColor = clrDarkRed;
         }
         else
         {
            biasText = "◯ N";
            textColor = clrWhite;
            bgColor = clrDarkSlateGray;
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
         ObjectSetInteger(0, objName, OBJPROP_BGCOLOR, bgColor);
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
void CreateMiniChart(string symbol, ENUM_TIMEFRAMES timeframe, string tfName, TimeframeAnalysis &tfAnalysis)
{
   uint startTime = GetTickCount();  // Performance timing
   Print(">>> [PERF] Starting mini chart creation for ", symbol, " ", tfName);

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
   string title = "📊 " + tfName + " Chart - " + symbol;
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

   uint afterUI = GetTickCount();
   Print(">>> [PERF] UI created in ", (afterUI - startTime), "ms");

   // Get price data for the timeframe - OPTIMIZED: Reduced from 30 to 20 bars
   double open[], high[], low[], close[];
   ArraySetAsSeries(open, true);
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   ArraySetAsSeries(close, true);

   int bars = 20;  // OPTIMIZED: Reduced from 30 to 20 bars (20 bars = 60 objects vs 30 bars = 90 objects)
   int copied = CopyOpen(symbol, timeframe, 0, bars, open);
   if(copied <= 0)
   {
      Print(">>> [ERROR] Failed to copy OHLC data for ", symbol, " ", tfName);
      return;
   }
   CopyHigh(symbol, timeframe, 0, bars, high);
   CopyLow(symbol, timeframe, 0, bars, low);
   CopyClose(symbol, timeframe, 0, bars, close);

   uint afterData = GetTickCount();
   Print(">>> [PERF] Data fetched in ", (afterData - afterUI), "ms (", bars, " bars)");
   
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

   string bias = tfAnalysis.bias == 1 ? "🟢 BULLISH" :
                 tfAnalysis.bias == -1 ? "🔴 BEARISH" : "⚪ NEUTRAL";

   string stats = StringFormat("Bias: %s | Confidence: %d/10\nOB: %d Bull / %d Bear | FVG: %d Bull / %d Bear",
                               bias,
                               tfAnalysis.confidence,
                               tfAnalysis.bullishOBCount,
                               tfAnalysis.bearishOBCount,
                               tfAnalysis.bullishFVGCount,
                               tfAnalysis.bearishFVGCount);
   
   ObjectSetString(0, "SymMaster_MiniStats", OBJPROP_TEXT, stats);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_COLOR, clrWhite);
   ObjectSetInteger(0, "SymMaster_MiniStats", OBJPROP_FONTSIZE, 9);

   uint endTime = GetTickCount();
   Print(">>> [PERF] TOTAL mini chart creation time: ", (endTime - startTime), "ms");

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
   // OPTIMIZED: Only delete 25 candles (was 50) since we only create 20
   for(int i = 0; i < 25; i++)
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

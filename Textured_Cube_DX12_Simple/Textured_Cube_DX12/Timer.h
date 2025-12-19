//======================================================================================
//	Ed Kurlyak 2023 Timer Class
//======================================================================================

#ifndef _TIMER_
#define _TIMER_

#include <windows.h>

class CTimer
{
public:
	
	void Timer_Start(float LimitFPS);
	int Calculate_FPS();
	float Get_Elapsed_Time();
	float Get_App_Time();
	float Get_Absolute_Time();
	

private:
	unsigned long   m_FrameRate;
	float           m_TimeScale;
	float           m_TimeElapsed;
    __int64         m_CurrentTime;
    __int64         m_LastTime;
	__int64         m_PerfFreq;
	
	unsigned long   m_FPSFrameCount;
	float           m_FPSTimeElapsed;
	
	float m_AbsoluteTime;
	float m_ElapsedTime;
	float m_AppTime;

	__int64 m_StartTime;
	__int64 m_AppStartTime;

	float m_LimitFPS;
};


#endif
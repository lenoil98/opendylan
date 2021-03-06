
/* This file is automatically generated; do not edit. */

extern HRESULT __stdcall __RPC_FAR
DW_IOleAdviseHolder_Advise ( 
	    IOleAdviseHolder __RPC_FAR * This, 
	    /* [unique][in] */ IAdviseSink __RPC_FAR *pAdvise,
	    /* [out] */ DWORD __RPC_FAR *pdwConnection);

extern HRESULT __stdcall __RPC_FAR
DW_IOleAdviseHolder_Unadvise ( 
	    IOleAdviseHolder __RPC_FAR * This, 
	    /* [in] */ DWORD dwConnection);

extern HRESULT __stdcall __RPC_FAR
DW_IOleAdviseHolder_EnumAdvise ( 
	    IOleAdviseHolder __RPC_FAR * This, 
	    /* [out] */ IEnumSTATDATA __RPC_FAR *__RPC_FAR *ppenumAdvise);

extern HRESULT __stdcall __RPC_FAR
DW_IOleAdviseHolder_SendOnRename ( 
	    IOleAdviseHolder __RPC_FAR * This, 
	    /* [unique][in] */ IMoniker __RPC_FAR *pmk);

extern HRESULT __stdcall __RPC_FAR
DW_IOleAdviseHolder_SendOnSave (
		IOleAdviseHolder __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleAdviseHolder_SendOnClose (
		IOleAdviseHolder __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache_Cache ( 
	    IOleCache __RPC_FAR * This, 
	    /* [unique][in] */ FORMATETC __RPC_FAR *pformatetc,
	    /* [in] */ DWORD advf,
	    /* [out] */ DWORD __RPC_FAR *pdwConnection);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache_Uncache ( 
	    IOleCache __RPC_FAR * This, 
	    /* [in] */ DWORD dwConnection);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache_EnumCache ( 
	    IOleCache __RPC_FAR * This, 
	    /* [out] */ IEnumSTATDATA __RPC_FAR *__RPC_FAR *ppenumSTATDATA);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache_InitCache ( 
	    IOleCache __RPC_FAR * This, 
	    /* [unique][in] */ IDataObject __RPC_FAR *pDataObject);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache_SetData ( 
	    IOleCache __RPC_FAR * This, 
	    /* [unique][in] */ FORMATETC __RPC_FAR *pformatetc,
	    /* [unique][in] */ STGMEDIUM __RPC_FAR *pmedium,
	    /* [in] */ BOOL fRelease);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache2_UpdateCache ( 
	    IOleCache2 __RPC_FAR * This, 
	    /* [in] */ LPDATAOBJECT pDataObject,
	    /* [in] */ DWORD grfUpdf,
	    /* [in] */ LPVOID pReserved);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCache2_DiscardCache ( 
	    IOleCache2 __RPC_FAR * This, 
	    /* [in] */ DWORD dwDiscardOptions);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCacheControl_OnRun ( 
	    IOleCacheControl __RPC_FAR * This, 
	    LPDATAOBJECT pDataObject);

extern HRESULT __stdcall __RPC_FAR
DW_IOleCacheControl_OnStop (
		IOleCacheControl __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IParseDisplayName_ParseDisplayName ( 
	    IParseDisplayName __RPC_FAR * This, 
	    /* [unique][in] */ IBindCtx __RPC_FAR *pbc,
	    /* [in] */ LPOLESTR pszDisplayName,
	    /* [out] */ ULONG __RPC_FAR *pchEaten,
	    /* [out] */ IMoniker __RPC_FAR *__RPC_FAR *ppmkOut);

extern HRESULT __stdcall __RPC_FAR
DW_IOleContainer_EnumObjects ( 
	    IOleContainer __RPC_FAR * This, 
	    /* [in] */ DWORD grfFlags,
	    /* [out] */ IEnumUnknown __RPC_FAR *__RPC_FAR *ppenum);

extern HRESULT __stdcall __RPC_FAR
DW_IOleContainer_LockContainer ( 
	    IOleContainer __RPC_FAR * This, 
	    /* [in] */ BOOL fLock);

extern HRESULT __stdcall __RPC_FAR
DW_IOleClientSite_SaveObject (
		IOleClientSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleClientSite_GetMoniker ( 
	    IOleClientSite __RPC_FAR * This, 
	    /* [in] */ DWORD dwAssign,
	    /* [in] */ DWORD dwWhichMoniker,
	    /* [out] */ IMoniker __RPC_FAR *__RPC_FAR *ppmk);

extern HRESULT __stdcall __RPC_FAR
DW_IOleClientSite_GetContainer ( 
	    IOleClientSite __RPC_FAR * This, 
	    /* [out] */ IOleContainer __RPC_FAR *__RPC_FAR *ppContainer);

extern HRESULT __stdcall __RPC_FAR
DW_IOleClientSite_ShowObject (
		IOleClientSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleClientSite_OnShowWindow ( 
	    IOleClientSite __RPC_FAR * This, 
	    /* [in] */ BOOL fShow);

extern HRESULT __stdcall __RPC_FAR
DW_IOleClientSite_RequestNewObjectLayout (
		IOleClientSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_SetClientSite ( 
	    IOleObject __RPC_FAR * This, 
	    /* [unique][in] */ IOleClientSite __RPC_FAR *pClientSite);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetClientSite ( 
	    IOleObject __RPC_FAR * This, 
	    /* [out] */ IOleClientSite __RPC_FAR *__RPC_FAR *ppClientSite);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_SetHostNames ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ LPCOLESTR szContainerApp,
	    /* [unique][in] */ LPCOLESTR szContainerObj);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_Close ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwSaveOption);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_SetMoniker ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwWhichMoniker,
	    /* [unique][in] */ IMoniker __RPC_FAR *pmk);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetMoniker ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwAssign,
	    /* [in] */ DWORD dwWhichMoniker,
	    /* [out] */ IMoniker __RPC_FAR *__RPC_FAR *ppmk);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_InitFromData ( 
	    IOleObject __RPC_FAR * This, 
	    /* [unique][in] */ IDataObject __RPC_FAR *pDataObject,
	    /* [in] */ BOOL fCreation,
	    /* [in] */ DWORD dwReserved);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetClipboardData ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwReserved,
	    /* [out] */ IDataObject __RPC_FAR *__RPC_FAR *ppDataObject);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_DoVerb ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ LONG iVerb,
	    /* [unique][in] */ LPMSG lpmsg,
	    /* [unique][in] */ IOleClientSite __RPC_FAR *pActiveSite,
	    /* [in] */ LONG lindex,
	    /* [in] */ HWND hwndParent,
	    /* [unique][in] */ LPCRECT lprcPosRect);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_EnumVerbs ( 
	    IOleObject __RPC_FAR * This, 
	    /* [out] */ IEnumOLEVERB __RPC_FAR *__RPC_FAR *ppEnumOleVerb);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_Update (
		IOleObject __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_IsUpToDate (
		IOleObject __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetUserClassID ( 
	    IOleObject __RPC_FAR * This, 
	    /* [out] */ CLSID __RPC_FAR *pClsid);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetUserType ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwFormOfType,
	    /* [out] */ LPOLESTR __RPC_FAR *pszUserType);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_SetExtent ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwDrawAspect,
	    /* [in] */ SIZEL __RPC_FAR *psizel);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetExtent ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwDrawAspect,
	    /* [out] */ SIZEL __RPC_FAR *psizel);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_Advise ( 
	    IOleObject __RPC_FAR * This, 
	    /* [unique][in] */ IAdviseSink __RPC_FAR *pAdvSink,
	    /* [out] */ DWORD __RPC_FAR *pdwConnection);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_Unadvise ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwConnection);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_EnumAdvise ( 
	    IOleObject __RPC_FAR * This, 
	    /* [out] */ IEnumSTATDATA __RPC_FAR *__RPC_FAR *ppenumAdvise);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_GetMiscStatus ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwAspect,
	    /* [out] */ DWORD __RPC_FAR *pdwStatus);

extern HRESULT __stdcall __RPC_FAR
DW_IOleObject_SetColorScheme ( 
	    IOleObject __RPC_FAR * This, 
	    /* [in] */ LOGPALETTE __RPC_FAR *pLogpal);

extern HRESULT __stdcall __RPC_FAR
DW_IOleWindow_GetWindow ( 
	    IOleWindow __RPC_FAR * This, 
	    /* [out] */ HWND __RPC_FAR *phwnd);

extern HRESULT __stdcall __RPC_FAR
DW_IOleWindow_ContextSensitiveHelp ( 
	    IOleWindow __RPC_FAR * This, 
	    /* [in] */ BOOL fEnterMode);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_SetUpdateOptions ( 
	    IOleLink __RPC_FAR * This, 
	    /* [in] */ DWORD dwUpdateOpt);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_GetUpdateOptions ( 
	    IOleLink __RPC_FAR * This, 
	    /* [out] */ DWORD __RPC_FAR *pdwUpdateOpt);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_SetSourceMoniker ( 
	    IOleLink __RPC_FAR * This, 
	    /* [unique][in] */ IMoniker __RPC_FAR *pmk,
	    /* [in] */ REFCLSID rclsid);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_GetSourceMoniker ( 
	    IOleLink __RPC_FAR * This, 
	    /* [out] */ IMoniker __RPC_FAR *__RPC_FAR *ppmk);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_SetSourceDisplayName ( 
	    IOleLink __RPC_FAR * This, 
	    /* [in] */ LPCOLESTR pszStatusText);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_GetSourceDisplayName ( 
	    IOleLink __RPC_FAR * This, 
	    /* [out] */ LPOLESTR __RPC_FAR *ppszDisplayName);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_BindToSource ( 
	    IOleLink __RPC_FAR * This, 
	    /* [in] */ DWORD bindflags,
	    /* [unique][in] */ IBindCtx __RPC_FAR *pbc);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_BindIfRunning (
		IOleLink __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_GetBoundSource ( 
	    IOleLink __RPC_FAR * This, 
	    /* [out] */ IUnknown __RPC_FAR *__RPC_FAR *ppunk);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_UnbindSource (
		IOleLink __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleLink_Update ( 
	    IOleLink __RPC_FAR * This, 
	    /* [unique][in] */ IBindCtx __RPC_FAR *pbc);

extern HRESULT __stdcall __RPC_FAR
DW_IOleItemContainer_GetObject ( 
	    IOleItemContainer __RPC_FAR * This, 
	    /* [in] */ LPOLESTR pszItem,
	    /* [in] */ DWORD dwSpeedNeeded,
	    /* [unique][in] */ IBindCtx __RPC_FAR *pbc,
	    /* [in] */ REFIID riid,
	    /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);

extern HRESULT __stdcall __RPC_FAR
DW_IOleItemContainer_GetObjectStorage ( 
	    IOleItemContainer __RPC_FAR * This, 
	    /* [in] */ LPOLESTR pszItem,
	    /* [unique][in] */ IBindCtx __RPC_FAR *pbc,
	    /* [in] */ REFIID riid,
	    /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvStorage);

extern HRESULT __stdcall __RPC_FAR
DW_IOleItemContainer_IsRunning ( 
	    IOleItemContainer __RPC_FAR * This, 
	    /* [in] */ LPOLESTR pszItem);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceUIWindow_GetBorder ( 
	    IOleInPlaceUIWindow __RPC_FAR * This, 
	    /* [out] */ LPRECT lprectBorder);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceUIWindow_RequestBorderSpace ( 
	    IOleInPlaceUIWindow __RPC_FAR * This, 
	    /* [unique][in] */ LPCBORDERWIDTHS pborderwidths);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceUIWindow_SetBorderSpace ( 
	    IOleInPlaceUIWindow __RPC_FAR * This, 
	    /* [unique][in] */ LPCBORDERWIDTHS pborderwidths);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceUIWindow_SetActiveObject ( 
	    IOleInPlaceUIWindow __RPC_FAR * This, 
	    /* [unique][in] */ IOleInPlaceActiveObject __RPC_FAR *pActiveObject,
	    /* [unique][string][in] */ LPCOLESTR pszObjName);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceActiveObject_TranslateAccelerator ( 
	    IOleInPlaceActiveObject __RPC_FAR * This, 
	    /* [in] */ LPMSG lpmsg);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceActiveObject_OnFrameWindowActivate ( 
	    IOleInPlaceActiveObject __RPC_FAR * This, 
	    /* [in] */ BOOL fActivate);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceActiveObject_OnDocWindowActivate ( 
	    IOleInPlaceActiveObject __RPC_FAR * This, 
	    /* [in] */ BOOL fActivate);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceActiveObject_ResizeBorder ( 
	    IOleInPlaceActiveObject __RPC_FAR * This, 
	    /* [in] */ LPCRECT prcBorder,
	    /* [unique][in] */ IOleInPlaceUIWindow __RPC_FAR *pUIWindow,
	    /* [in] */ BOOL fFrameWindow);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceActiveObject_EnableModeless ( 
	    IOleInPlaceActiveObject __RPC_FAR * This, 
	    /* [in] */ BOOL fEnable);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceFrame_InsertMenus ( 
	    IOleInPlaceFrame __RPC_FAR * This, 
	    /* [in] */ HMENU hmenuShared,
	    /* [out][in] */ LPOLEMENUGROUPWIDTHS lpMenuWidths);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceFrame_SetMenu ( 
	    IOleInPlaceFrame __RPC_FAR * This, 
	    /* [in] */ HMENU hmenuShared,
	    /* [in] */ HOLEMENU holemenu,
	    /* [in] */ HWND hwndActiveObject);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceFrame_RemoveMenus ( 
	    IOleInPlaceFrame __RPC_FAR * This, 
	    /* [in] */ HMENU hmenuShared);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceFrame_SetStatusText ( 
	    IOleInPlaceFrame __RPC_FAR * This, 
	    /* [unique][in] */ LPCOLESTR pszStatusText);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceFrame_EnableModeless ( 
	    IOleInPlaceFrame __RPC_FAR * This, 
	    /* [in] */ BOOL fEnable);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceFrame_TranslateAccelerator ( 
	    IOleInPlaceFrame __RPC_FAR * This, 
	    /* [in] */ LPMSG lpmsg,
	    /* [in] */ WORD wID);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceObject_InPlaceDeactivate (
		IOleInPlaceObject __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceObject_UIDeactivate (
		IOleInPlaceObject __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceObject_SetObjectRects ( 
	    IOleInPlaceObject __RPC_FAR * This, 
	    /* [in] */ LPCRECT lprcPosRect,
	    /* [in] */ LPCRECT lprcClipRect);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceObject_ReactivateAndUndo (
		IOleInPlaceObject __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_CanInPlaceActivate (
		IOleInPlaceSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_OnInPlaceActivate (
		IOleInPlaceSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_OnUIActivate (
		IOleInPlaceSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_GetWindowContext ( 
	    IOleInPlaceSite __RPC_FAR * This, 
	    /* [out] */ IOleInPlaceFrame __RPC_FAR *__RPC_FAR *ppFrame,
	    /* [out] */ IOleInPlaceUIWindow __RPC_FAR *__RPC_FAR *ppDoc,
	    /* [out] */ LPRECT lprcPosRect,
	    /* [out] */ LPRECT lprcClipRect,
	    /* [out][in] */ LPOLEINPLACEFRAMEINFO lpFrameInfo);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_Scroll ( 
	    IOleInPlaceSite __RPC_FAR * This, 
	    /* [in] */ SIZE scrollExtant);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_OnUIDeactivate ( 
	    IOleInPlaceSite __RPC_FAR * This, 
	    /* [in] */ BOOL fUndoable);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_OnInPlaceDeactivate (
		IOleInPlaceSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_DiscardUndoState (
		IOleInPlaceSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_DeactivateAndUndo (
		IOleInPlaceSite __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IOleInPlaceSite_OnPosRectChange ( 
	    IOleInPlaceSite __RPC_FAR * This, 
	    /* [in] */ LPCRECT lprcPosRect);

extern HRESULT __stdcall __RPC_FAR
DW_IContinue_FContinue (
		IContinue __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject_Draw ( 
	    IViewObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwDrawAspect,
	    /* [in] */ LONG lindex,
	    /* [unique][in] */ void __RPC_FAR *pvAspect,
	    /* [unique][in] */ DVTARGETDEVICE __RPC_FAR *ptd,
	    /* [in] */ HDC hdcTargetDev,
	    /* [in] */ HDC hdcDraw,
	    /* [in] */ LPCRECTL lprcBounds,
	    /* [unique][in] */ LPCRECTL lprcWBounds,
	    /* [in] */ BOOL ( STDMETHODCALLTYPE __RPC_FAR *pfnContinue )( 
	        DWORD dwContinue),
	    /* [in] */ DWORD dwContinue);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject_GetColorSet ( 
	    IViewObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwDrawAspect,
	    /* [in] */ LONG lindex,
	    /* [unique][in] */ void __RPC_FAR *pvAspect,
	    /* [unique][in] */ DVTARGETDEVICE __RPC_FAR *ptd,
	    /* [in] */ HDC hicTargetDev,
	    /* [out] */ LOGPALETTE __RPC_FAR *__RPC_FAR *ppColorSet);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject_Freeze ( 
	    IViewObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwDrawAspect,
	    /* [in] */ LONG lindex,
	    /* [unique][in] */ void __RPC_FAR *pvAspect,
	    /* [out] */ DWORD __RPC_FAR *pdwFreeze);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject_Unfreeze ( 
	    IViewObject __RPC_FAR * This, 
	    /* [in] */ DWORD dwFreeze);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject_SetAdvise ( 
	    IViewObject __RPC_FAR * This, 
	    /* [in] */ DWORD aspects,
	    /* [in] */ DWORD advf,
	    /* [unique][in] */ IAdviseSink __RPC_FAR *pAdvSink);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject_GetAdvise ( 
	    IViewObject __RPC_FAR * This, 
	    /* [unique][out] */ DWORD __RPC_FAR *pAspects,
	    /* [unique][out] */ DWORD __RPC_FAR *pAdvf,
	    /* [out] */ IAdviseSink __RPC_FAR *__RPC_FAR *ppAdvSink);

extern HRESULT __stdcall __RPC_FAR
DW_IViewObject2_GetExtent ( 
	    IViewObject2 __RPC_FAR * This, 
	    /* [in] */ DWORD dwDrawAspect,
	    /* [in] */ LONG lindex,
	    /* [unique][in] */ DVTARGETDEVICE __RPC_FAR *ptd,
	    /* [out] */ LPSIZEL lpsizel);

extern HRESULT __stdcall __RPC_FAR
DW_IDropSource_QueryContinueDrag ( 
	    IDropSource __RPC_FAR * This, 
	    /* [in] */ BOOL fEscapePressed,
	    /* [in] */ DWORD grfKeyState);

extern HRESULT __stdcall __RPC_FAR
DW_IDropSource_GiveFeedback ( 
	    IDropSource __RPC_FAR * This, 
	    /* [in] */ DWORD dwEffect);

extern HRESULT __stdcall __RPC_FAR
DW_IDropTarget_DragEnter ( 
	    IDropTarget __RPC_FAR * This, 
	    /* [unique][in] */ IDataObject __RPC_FAR *pDataObj,
	    /* [in] */ DWORD grfKeyState,
	    /* [in] */ POINTL pt,
	    /* [out][in] */ DWORD __RPC_FAR *pdwEffect);

extern HRESULT __stdcall __RPC_FAR
DW_IDropTarget_DragOver ( 
	    IDropTarget __RPC_FAR * This, 
	    /* [in] */ DWORD grfKeyState,
	    /* [in] */ POINTL pt,
	    /* [out][in] */ DWORD __RPC_FAR *pdwEffect);

extern HRESULT __stdcall __RPC_FAR
DW_IDropTarget_DragLeave (
		IDropTarget __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IDropTarget_Drop ( 
	    IDropTarget __RPC_FAR * This, 
	    /* [unique][in] */ IDataObject __RPC_FAR *pDataObj,
	    /* [in] */ DWORD grfKeyState,
	    /* [in] */ POINTL pt,
	    /* [out][in] */ DWORD __RPC_FAR *pdwEffect);

extern HRESULT __stdcall __RPC_FAR
DW_IEnumOLEVERB_Next ( 
	    IEnumOLEVERB __RPC_FAR * This, 
	    /* [in] */ ULONG celt,
	    /* [length_is][size_is][out] */ LPOLEVERB rgelt,
	    /* [out] */ ULONG __RPC_FAR *pceltFetched);

extern HRESULT __stdcall __RPC_FAR
DW_IEnumOLEVERB_Skip ( 
	    IEnumOLEVERB __RPC_FAR * This, 
	    /* [in] */ ULONG celt);

extern HRESULT __stdcall __RPC_FAR
DW_IEnumOLEVERB_Reset (
		IEnumOLEVERB __RPC_FAR * This);

extern HRESULT __stdcall __RPC_FAR
DW_IEnumOLEVERB_Clone ( 
	    IEnumOLEVERB __RPC_FAR * This, 
	    /* [out] */ IEnumOLEVERB __RPC_FAR *__RPC_FAR *ppenum);

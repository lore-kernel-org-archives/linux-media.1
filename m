Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F234D797D
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848483; cv=fail; b=YDweU97gWNDeoLDV6bvqaWXoKctETabP0iFeHAtXfJNpzSGlZnCCOjO8HiGMUVhZJS523BHXUOJNcLNQ6Iq7Spmo4H+jV35deB2MkQAkxhEcbLbg/Fl6mCb72UFJEryQYetjQyJzyjDOvREv4uKONhgsa9tLQcAdzjCFcoQcX/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848483; c=relaxed/simple;
	bh=179CwlDdnGkOXiS+vZZeFGdd8oKc6VGLlHS3zseQ1Oo=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=PqSs69rHSUh1xbOjpZdXyJsof4MmxXAfOLdopBJ5fM1xHCtr8Leeqekv/MMrr3Bk0POfW2oP8GdFvk2IuLH9dlZe3voaQMXiKOG+gL7Igr5NaaQjh/dmFZ5y7c6qR067AA9XguJcCZrr/rI+LiJNId7eY6jPjnSelLlgMQJ4l7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pp0s3xMU; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pp0s3xMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790848482; x=1822384482;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=179CwlDdnGkOXiS+vZZeFGdd8oKc6VGLlHS3zseQ1Oo=;
  b=Pp0s3xMU5ASSWunw5b2WYx0yl6aHDPF1sWWceGoUDJOwfN+HgUuriKR6
   lCzCOlbqpY7nYMVZIVd/IJpgx28KMG0tJ43YqHxZfhVvg5rV1u03Me/cM
   yCbqqjeDN68e49LU3AEl+opAbwymr/w3cEsLAtv9w3XG5rJKHtGVfT6PN
   fCKUapJ2+BU16BktUm7uPoJGy/BqA/PA6WZSPWKAuABdf/a1jWWkztg14
   FIAzwedGlpXthDRCXOaP2zwSq+nE14QlY0hc4Whn2KjlR+fTsVXjF0FfQ
   QRWO9Qwg9ieVcsLgl+WPPDd3Pdbtjgf/lDry36ARHz5hKPK4EtWcJEKW+
   Q==;
X-CSE-ConnectionGUID: i27IkpSORAe/JgfIEkmRuQ==
X-CSE-MsgGUID: Qow0JprlQ8GXxO1eBboJMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90814357"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90814357"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 02:54:41 -0700
X-CSE-ConnectionGUID: EU8+TRm8TgOITdhNQX60mg==
X-CSE-MsgGUID: 5uAZ87liTSiKNSV9RjE20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="8809"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 02:54:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 02:54:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 02:54:40 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 02:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1fChWagFcgU5w2FnHIeP0l2ysYe+gB0uvOqo8OgR3EDrEw760Z2VaRhQSdY0WKMiZft4mjmmgrOuGB8fI3I0b2IdzfsvehfsmTzhKxbOXNoQTISgbuZV6leN47IuMhudKk0ZRCnPe9zbTiPhOiGlVFNXtxWDM9V/AAYXRj9FKXURKS5U2oGDOzGC8gVMI6gVYSq9Qyhdi6CRE8LRDige0/HTr4zLI1ZoGLOZVBImZ/Ru3nIAB7DwBxnLlez8EW4Bdn+HQFV9gMFmyuOM3Tzz0p7AH4Yraf54lgC36jkc+qJyEndCAhXEIraFIsjDZ95Zh2KIiajIrWI+PhvEKT08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pl/shCTDHQu88vVQ6+B00O/NRsIBFMzoC6DDAnaO3U=;
 b=K3+RQakHRk2xcZCBoo654ZDLrENFX855+O77wzDim0QfwGp48zKkBSqD/OUyr1G5N3yCTZAYFynrb5Z/0TW44z0tbrLUFTWNn5Phi+MqXkWBwei+huj3xwkVU/Yl/y1nUUU4SwcYRBemOOqagTTNzF7aZKq/z1RgANbWJNe8k65H22/OBzzkZcSBI1NtMW2/aXhuTcFgXmqStIt4iTBoab7GObCykau92MLjrFoXDwlODKyHo+t7U+0YRY5Vockwpns7b7jFerQOBJ8MvdhTG3VS58z/xMI3cz55qK5Bj+VOsx2qV97N2fcBCFc6+m+51Ci2vUMBHG0AysHFEEWFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 1 Oct
 2026 09:54:33 +0000
Received: from CY8PR11MB7686.namprd11.prod.outlook.com
 ([fe80::215a:84fc:8eb6:6609]) by CY8PR11MB7686.namprd11.prod.outlook.com
 ([fe80::215a:84fc:8eb6:6609%6]) with mapi id 15.21.0451.027; Thu, 1 Oct 2026
 09:54:33 +0000
Date: Thu, 1 Oct 2026 15:24:25 +0530
From: Manik Bajpai <manik.bajpai@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Divyamani Tripathi <divyamani.tripathi@intel.com>,
	<linux-media@vger.kernel.org>, <antti.laakso@linux.intel.com>,
	<sarang.sapre@intel.com>, <manik.bajpai@intel.com>
Subject: Re: [PATCH v2 7/7] media: ipu6: add PCI ID for IPU8
In-Reply-To: <ar4PdptP1Rqol6h5@kekkonen.localdomain>
Message-ID: <08543aa9-c6b7-da9d-eadf-2426635860f7@intel.com>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com> <20261001073134.4031143-8-divyamani.tripathi@intel.com> <ar4PdptP1Rqol6h5@kekkonen.localdomain>
Content-Type: text/plain; charset="US-ASCII"
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To CY8PR11MB7686.namprd11.prod.outlook.com
 (2603:10b6:930:70::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7686:EE_|PH8PR11MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a234201-6d87-4388-89e0-08df1fa1fe5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KXYtgXVwjdmZmqT/WZ8fh30oeFOXEIp+9hBt5NnPlGdM+Vm2adXNQ6KkXPqJUs2PtF0Xf13lL92kd/ps8dt+RuW8jSn3gZiOG6Jgk00lvob3CyQO8LxjkTc/FT6R2lZPOXO8hiUhucko/A73Jx06DfNbBI+LZXlkJsRJGhtL9MU8D5ofvMjrPljkJHQVlmOtBB0KRjkXmBOd6x6yLpruo9rWwg1kUIbERv0/fDedGcqVg1pxoScpUX7MirD8oie35JRSEqUKxxQpM0FX+9nMs3aVETw47Vz/pc0TEuHBNJCi1QPzkJ6Pyp+ES7+9KHCfQm0ttius70DSuI8+2uMckbDB0n8x/ZjET7VBQtn+9X14HMS1DrY8Pf5WwoyUhAx81BsqwQFIEnrvLf6ofcsdJz0KnDcjsQ8+2/UcPy5Ou1BSX4Fz3wxwgTRreu0Qj70y4Q2JbIhpZcuygRf0l/JAfPP1f4VIU60WXVb7oXzk7KJnwW2WAeTHrPcyIhHQgU7ZJNHd5l26+3aoC3L3Xs4LHY0G9lk++RhHSZWAiMYrym+WOD0xLq7+/0uGZivf0SelUAc3jtCxEW86Qc8s0dCFv/YguJrTKyyu6Ou1mQDJL6WyM25HiavAwQQdwItqwv6Zup6t3TgCJV6cuurbfjFkFzvarkPYo63DcLZrmgXQcdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7686.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xnRTLO6sOQbaBTN+d1n/XPMjhIeGUTiIWryLZGnKafWRd85Lze+1uuZOBjBj?=
 =?us-ascii?Q?QuiFIdb4UQ0QAXfhIMGESuxUPXUI5wKuzxyGeZEXo9vCLSMuIc/V6FQJG/Mq?=
 =?us-ascii?Q?n2JChBo26w4J95HQ3MrwvQs/1YkbfAa664qsxQMj3cw17kf7/863GXeOwipB?=
 =?us-ascii?Q?o7QuCsfv4Aw0BEcWVu89NDFdfPnVrbLa2h950bdaUT1Gf359h4hgVixW4bRn?=
 =?us-ascii?Q?qjI+w8wRf3PXxYVKFDaEnLRH8fIv+lKeVSCYw0mY9owu4CnK3Ir79wDv39qH?=
 =?us-ascii?Q?TuiyE3e5LlVz6UEIC+zsK3tOSszl95D2ULpA4jLpCKK0H6YL0fxsE0hjx1Qm?=
 =?us-ascii?Q?4zlR5SE2rMSm5KZ1pdHb2m4AA43dYmT0DYho/wlZ+frDmv3xxFKFMNhknx3i?=
 =?us-ascii?Q?Z6t5ijpa37vLWEBYoJGDLm9UyHPqQplm+H2xRG68pgGtPdqpQpFsbL/yRe1T?=
 =?us-ascii?Q?jJCSpgloR6AteorYys/0fxyWkQUUd/rVEnT0nYBiIG9jk7/SigUxjI5mZ5kP?=
 =?us-ascii?Q?lnROncYHf1paFARgiqOKRYGEglGKVgGsmc0kVgk/wfHJAf3XAc2d3JNp5X2s?=
 =?us-ascii?Q?X6qE2W1OECzTn177tKXiks3LrVxeiavsbRXeKDS56sE4FXMPtq+3Et9K9WF0?=
 =?us-ascii?Q?I33FLiq6MNxBhkIscVOI89yRoOTClw+zCcTu8CvACjcQ2LrR2Laiu/RPD5c7?=
 =?us-ascii?Q?HMXtPc16kb3HRLAxo/U1BNr6xOEtWwJKdXEbCCP0/q2T6ptNsUGTyvf0u+9u?=
 =?us-ascii?Q?vvwE7elhhTP7BEvfkv9qYk32n68Wvre4x2CrAfuaLfNhhL0qml8J7h6o8b5+?=
 =?us-ascii?Q?pLjeJvHHwKQQfa5ETziL5nCNMcGCwg8uGrRP2PyzA671vjWrxQviI4hFYXqZ?=
 =?us-ascii?Q?gf5CieIrtAMwbs9ENDudfFchVEG/6X+cgfsqY9aaeZVvEmd2iTDxssYWmVv5?=
 =?us-ascii?Q?OEmff/nFP++yNDa2WAcgBKmneCb8Ur1aRygcB7IJEEZ8Wr8AUB2XRrMQ3+fF?=
 =?us-ascii?Q?8eRfmwZb3YRshjy+IvRpLbBdjRssfQxCyn2rosF2pad7VLaNMEpGc4moxaIn?=
 =?us-ascii?Q?bVAh8D26RZFWvjzL363rY55GKsEqaXyWuKsBnWwlSgjmUQPdOoM590NxFIyO?=
 =?us-ascii?Q?+t1chjyg64j9+s1Kxk2UA8gPgbQaVQP5bD6wigApZHLrP3DCA9GK3CswsV5z?=
 =?us-ascii?Q?7n2yiV2oIT1syIlV1MVYjU7bSbYdpW5Cmg32F0dJi3k+IA1anw2FsF6JLWz9?=
 =?us-ascii?Q?fISZg4s/oA2+UkJ4J0A3CdV7+CoV2fFvbx+Zkzc6hBPOzK2BWvCmajYjjZbe?=
 =?us-ascii?Q?/frXT7AstSrjAYNZ8W2BNdiql5G6wIZb3Bx3zPDZ0vfJqNy6LL8f6+pRqKR4?=
 =?us-ascii?Q?SvgXmcQl3EmrUxmi28/xFsKPmJD0WvSwmlKP1yWImZwOy7RdsXcRqWOm8thw?=
 =?us-ascii?Q?pk57Hiy09J+h7+3nJSizrYdJPjais4W9L9KTmYwwJ5YiSx7cV9T6/sSgc0q8?=
 =?us-ascii?Q?9Yc1AifH9MmEHP1lgMpkwWyVXwohhaojx06CTh6XU/JJf8GaO0JnUYakgNMy?=
 =?us-ascii?Q?+6sL8aJ/c/BDgJSSdoMXuVxynPby3GHPAtw+O9IHOl3XWeW8wqNZXsi3jqdN?=
 =?us-ascii?Q?eL9Im9jUUCRQtFP3pyZRnh/3eqUdnTAYdFheS5Vnl/aOITaktA/WHmM7Ei4A?=
 =?us-ascii?Q?jQItfP1VxIz5RXJtxIq3Ldn+5Y5mGUB6jPpefWcXOjLGBdrF1YRiO3we6vgu?=
 =?us-ascii?Q?7eFKTtAt6g=3D=3D?=
X-Exchange-RoutingPolicyChecked: NcFkMkePsFPxPCw2wi4MYV5YdRsoIqP00caeqXuepuv2XviPHsxNRatUlVlbakocYE0+KzxQBjT20ZqXaAPr5rZ1QcCYSpakACEDpbzrhpjvpkpbYPpuZiuMHRuF9Z/WWZHkKqh233tr87JMoGyJwYfW2BzkYCAoYpfVKXzRFu0V6JLzzibFNmQNFdJwIDWg30dsX7ug08EjbX9dcuwsNnqltT3PLhwaSY4iQ+GyCnAagL+RP1ebWyv+wK3aeMIHmCwKx1yj24PTMfSUyD5sWfClVwO279XpixdmxcHrgaPQa5C/C3YDkoQKLZD3UVHD3IuMYbQ6DL3HrV20fG1dYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a234201-6d87-4388-89e0-08df1fa1fe5c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:54:32.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uhob7TTr+zHWa1Fg2lO13t3rqmabKri+QsfbKClPZAUGO5IHD02b2CrbioR9Q7QWZjAn3KDeMWXoLkH8aB/z8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
X-OriginatorOrg: intel.com


Hi Sakari,

On Thu, 1 Oct 2026, Sakari Ailus wrote:

> Hi Divyamani,
> 
> On Thu, Oct 01, 2026 at 10:31:34AM +0300, Divyamani Tripathi wrote:
> >  static const struct ipu6_buttress_registers ipu6_buttress_regs = {
> >  	/* Registers */
> >  	.irq_status	= BUTTRESS_REG_ISR_STATUS,
> > @@ -624,7 +646,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  	int ret;
> >  
> >  	if ((id->device == PCI_DEVICE_ID_INTEL_IPU7 ||
> > -	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5) && force_no_probe_ipu7)
> > +	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5 ||
> > +	     id->device == PCI_DEVICE_ID_INTEL_IPU8) && force_no_probe_ipu7)
> 
> One question about this -- is there a need to do this for IPU8? There's no
> IPU8 support in the ipu7 staging driver so I might leave this as-is.

If I go through the (rest of) the patches from Divyamani, I do see some 
IPU8 functionality being added. I was wondering if we still needed to do 
away with this portion of code.

> 
> >  		return -ENODEV;
> >  
> >  	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
> 
> -- 
> Regards,
> 
> Sakari Ailus
> 

-With regards,
 Manik

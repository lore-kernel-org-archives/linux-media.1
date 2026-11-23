Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795421921;
	b=SsaB7zOv2t/OVJxfTasGdcakHuKWlDZ4jH8GgqciUC48IkENn2mGYl2RlqwJyYcjFwMl
	 kTgIqxuTi/ny0lNZbuEvWIzWiAX72RWsXdPtWAu4A/IeyfGSWmnDUU17i9I0gUFigntTk
	 4T7+fOhGqHJmRi2WlKRNBKqVrB10xP6LGb6/13WxCFxkiaXgfdXKLGbdXOMsrINS+nbtQ
	 Ga5z+7AzCT5v2fF6UlNVD4iSWf1WoXY4IDvmH0H6AcDaynpDF6hKYaksPX3cknjw6W5U1
	 xz8QXF/piIKHMcpo8ANebG3EiFFc7dNaKzWhg8N0f/BlscPgWAl1Mji7oyJC6N1TfAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421921;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=teY7ABrX/PVYfES6Mz2Q4ZxySZ67x+Mg09XuKQNFIKs=;
	b=SBqfseDOmtDJFdOxvHGPlHsW72I8tEAPVlWyVeBpG1i23H3POxKJMSKK0p3aa4TLtxwA
	 RYHv73K7kZBFx+HZTw3WsmuXbzhrd/9klOhCBnecvXeAb8H+PnMwz3WNbmQCj9zhGxZ7L
	 f42vzHsk77ABBxTevJ6g6OvWy/i2vONfBf7uXR72W1w8s6JdMpyv+GHuT1laJ/GuuKgwc
	 LL1M97r79OFIIc5llpPKMq+n3M/GxXDmw70UDHgjctAKg6YL2VkUTQFhMLw24fT85KwTT
	 s7vAzlJSp5cu7zV0prjXSPXTK15oUb7DE4NxnFX8sDQQ70XQmxM1CGoNMWbvLr+sknw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1+djo3lW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.70
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68755606A31A;
	Mon, 23 Nov 2026 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68755606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1+djo3lW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXV07vS0sK2J7CrLtWM/Df1JO8QxEJp0f5Bu/CkruHtVe8V6asrBZZgjbpHeevWau6GHVp/GLTqq4dv8V0mTY1NYoixc7sK4kBSh6naLF41IEbeS2vwibYuJCHd2LtPBbW3pS38iW7qZx3vaXpoZy+EUDn96Qjt7Ij51zS5mD1in8ubpEsd+z6tOvtcJ9lnRgBp0LAFBogDjLhudeomi9OuXIX6TUwPNPRrHGHmf9bZZjdLGuF7M3ZIyU/OwFGq595D7TTq/Cb52baKIOI1ViNXxM5XYGmJZVJO0g3a2iDaUMAddnKMB1EfBQIj8K4YEFs6HqojxjN/IYoqMAW3CdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teY7ABrX/PVYfES6Mz2Q4ZxySZ67x+Mg09XuKQNFIKs=;
 b=nxbI7D7L52UzfSvs0dMLIzr6Q80MjM2KeqsJoSBpcZSaK1+wVXvzkZrHwMTT5SY8AWsCAh837/u4am0M+Fmz5PCZe6yooECnoFCgyx8/Ie45/n1Jxu+N8wuSPYnz/Q9+PJMcWx0uvbOsLFKue3lExP1s5eF3j64gntrAEKp/ux2x6oKfBINOdaZcI+9fgg5fz2ICaGzAM6XhPWLUnF8OXLaeF7uDEBYTETb5nI2m/UKgsootHsus5w3/QTzmNe0Bd1OeBF/TdHQz16Tk356451vdA/BYmoWSJg8ZQVBezkTgQXh9btImO22/HMO4PirOzPv55e5rRsN0VpoVYCzUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teY7ABrX/PVYfES6Mz2Q4ZxySZ67x+Mg09XuKQNFIKs=;
 b=1+djo3lW0GtMCZk3KLNKU1LfynCr5ECk9yQghgaGrsWJZ31WAi4gAFE/Ki6wVYid2Rws6pFEs2Wj5ZpuHaTQBMXGSZVLGjFuAO8ph1/mucQUbnGwTsKpmFUOW19czFhRVgBrrlWpjgKjQixyW+SMm44Vqfhe8KlDZPrSmm2zXlc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 08:18:35 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 08:18:35 +0000
Message-ID: <958ae6b7-dc91-4854-a904-7582020f4413@amd.com>
Date: Mon, 23 Nov 2026 09:18:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
To: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
 <e2f4a6b4-0615-4b3a-b64c-408a27fdeade@web.de>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <e2f4a6b4-0615-4b3a-b64c-408a27fdeade@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0023.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::12) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d383bc-35ac-4ff5-bab5-08df493a5eb8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261026121527099003|10067099003|261009223027099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	mC4UWNznLgj3u6c7/XUMJLwqZWVYFUqqSIrXmGETsyca5EKEM5TE+8xmKWBKKY9u61yZ5M76XyJsFNhxbUozphKNtnfL2C0GJn8bCNDESBU6tV8eW+hZNG6qIMS0w8foD3ucFMFFv6Y1jajh4wlbysdnTdzgs0sSXrDPgrhI8kfP8DmsaLAgL3NdYi8kpd9OrSZJtBS41xrNYjNtD1DmC2I8PIXxUywlr7s89odgFFF3+Ap2GJEAHYL+7OzGBk4SCL+fivJwHVRSGzeY2UqjVxPAeh3wtX0nC1SpHJKGeUJNPjSGqc4CMNVqzF7gm6ij5Y6EGPqFEAaKMc7xnkleEDiIEZ1wrRHA55UO5Sm2f3f/7S3xRKyq2eaPZ8dX7Ka4NGGcUnPzdL5TKsQNYR1gFUYZbAG2JO+oNdCYvkU1o0X0C4cWB833PljGfWOyhToDKrhjAnW7C+EQHzG0HyWYbIpxG6A6wLRpSNSKXLYOnC3vwkPopBIkbJgimSdcX+7DzIbETpeicBU/Loe0tSPQtxNW+3povqu8AS6w7Mp+DvyeASYOhhsupRHFiMG5qkTm9Rpjl60kZKJ6p6OA6/Yi/D/TmcszeDthYxkKCiNszHfqA63hXk1jfi3gghGAeCGv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261026121527099003)(10067099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UERHbFU3RnN1VUtIWTRqV2JqRmNzUkVEYk4zbEJGWk9maUZYTk40WjNwRmpC?=
 =?utf-8?B?QS9jR01oWmFaZU8zR2h6U05NZlppQXFYQlJGeHhmVmQzaTNlMldUUjN5UHRj?=
 =?utf-8?B?QWJxWkQ1bENZMWJmWGlsNGVTbTZXcFFnb0djMjk3Qy9qS0Jqd25NVG13WUVW?=
 =?utf-8?B?d0tScFhaUitjVTJkMXd4MjdoaVdCZHNTRTdjazMwNXNVdEhrem44SlR6OVU1?=
 =?utf-8?B?KzRKYlBBK1JVN05rT21kaCt0WDFvYUFoWUpwM1IraUF3cEhUNU9BZ3FoOEMz?=
 =?utf-8?B?VWFqaE44OHNnWTI0U2pseEFscFVBTEhiYURRZTFLdGF6dENvU01GZkZzSFJT?=
 =?utf-8?B?QWtDN0g4eWlFREoxMFEzTU9oK0FYSXVnbHdXWllybjlTejVJMDRVNnJJLy9M?=
 =?utf-8?B?SUIrRlREc3VmbENKMnI3dDI3dVZGRnBTdXEvSUNhODdBS3pvTUV2cWJKYnRu?=
 =?utf-8?B?R2c0ckg2VTVqTlB5Q2kyOGZHRUMxeVJQOCs5aVl6KzN4SEhxdmc2T3lHbE95?=
 =?utf-8?B?OG4wd3UvWmkvcElvZHpzWGhGY1o2S1EwNWs2ZFFUTnR0Y3ZFc3FJVUloU0Jv?=
 =?utf-8?B?VU00ekp2Q2xEZmE4MTdOZVdGa0NnU0MxSnhSL3lKckg4a3JJUDMxYXIrbmtD?=
 =?utf-8?B?QW43NXVRMmxMcDFpWTJRVDZlbVNxSUZaaUkreTZNSDI2WEVNMlkyRHBpMlpq?=
 =?utf-8?B?NlVkM2k2R3l1dnZNd21sVWw5ZzRUMU55SlIzc1BKQWVKcnNoeGlRakVROTlw?=
 =?utf-8?B?Witwci9YRVlxTFlCR2NiRUl6OFZRKzFPNTdFUFluejJyVUphWVNNNVZreGRv?=
 =?utf-8?B?Q1BoYlBEazJQdlY4aVVHemhVYVlGSFFSM0VYYW5pVFhIUnEya0Y3Q0xVQ21Z?=
 =?utf-8?B?a2hKV041eGpQWS8rU2FvZDJzOHdDZVlOdDdvVjdiYVE2ektRZWI5STBxbVcz?=
 =?utf-8?B?Qk1WM0ZJVEpiTFRGcHh6aGxMZndneFhicmFXL3ErNDJDNUpPcHRmaFJ2Z0Vi?=
 =?utf-8?B?dkN3S0N6U1U1VVB1Vnp6bTdLRGhSS2ZQcHp5emQvTG43S2QzaTNBTXVzUHdU?=
 =?utf-8?B?a21MenFKZDV4Rm5WajFmdE55VU1OcDZ1bFE2Z1lTQVZ6Nk5UR09xYW5hNzRR?=
 =?utf-8?B?M2RMYTlVRmVqdllqZWlVdFliRzFyVjdPSXVQZUNURXBKWDdFdzBveGJxVTcx?=
 =?utf-8?B?YVplN284SWNrak1yeDhjTmZ4eFBmaXd2MW40NHJaUFlobGE3OVN2UmNpL0ZU?=
 =?utf-8?B?U1Jjd0UwVlMyK1hxaHdvQlNEV203OXJ6YXFnT0pkeDJLTWdtOFBha29iZWti?=
 =?utf-8?B?WTkxNHk4SkNXOEFXZEErbms2T0VNeklKdzEwaDVaZHBhL3RPRDRmZlllc0lt?=
 =?utf-8?B?bmR3MGhyZjQ3NHhrc0x1TE91bTlwc3QrU1JtcHprSDVlcWZQMkNqVlFJaFJh?=
 =?utf-8?B?d2JMUEVMN2tOV2dmNk5ZRFM3SkJZQ202TXgxSXVwRCtybmNLelVJNXQ4dUZG?=
 =?utf-8?B?ZFhBL2Y0Y2YrUTEwc2JZNHZ4RHRRWW1tWmFsRXp0UzcvbDR4OUNhZng3NFRB?=
 =?utf-8?B?RENXaXdCaVhVQ3BGaTFuVzMwV1VlQmtGUnd5Sis1c2FTUWRVS0FDekx3c2JR?=
 =?utf-8?B?QmZtTkxzek43N1YyUHpQUnA4WTNCUVpvdHRFLzB3bThlUmNpY05XRDIzZWxw?=
 =?utf-8?B?MFQyVDBZcWI0bzEyS3hkN1hOcW0rbkNuOFo3UVgybUgyazM2OHNsNENkR0xQ?=
 =?utf-8?B?dU1wbENwNHJhREZLSjcvWDVnYzNDK1IxNGRYY2swaGFhNEtka2hTKzdsZG1p?=
 =?utf-8?B?RWt3Wll5aFdhWWVwWlVkUEVpWUc4cVh2MHNnRlFkTStJSnlKbTJRdlhIRE5E?=
 =?utf-8?B?eCtobTZSYWYrWHhKbm1iSlNqZVdMUUhRUkpteElSbEg4NUVUS0o3UUw4UHcw?=
 =?utf-8?B?MExIOHhvS25JbUdwemI1NnFuRWlreTJOMHhOUFNMM24xZWdQZ1ZpRnJHWU5z?=
 =?utf-8?B?WWdYeU5ZTDFKb0cxWE9WVEZGVllBNlFEc2oyYVQyMmlQelIwVWhoWjBSRCtD?=
 =?utf-8?B?R3pFcHFFdHNkU3EyVk1KS2RzVVBpOCtxMGNid3VGaE9uaWluQ3hLRlAzRkYy?=
 =?utf-8?B?UFRoRmVGTUtXTGNDZHd3TWpGTXFmUTdlM3FTa29EUDRBYkwzcUZTcmtuUyts?=
 =?utf-8?B?bkdHWlBMNktPVklWcTlGckhIdWtMNktBU0V2NnVRK3dDa1dELytCYmpoaDQr?=
 =?utf-8?B?djJPa1RjMkVuelhzMG1oSkFFblU1SmxrN2ZidkQ5K3dZRFdidmxYS2t3THB5?=
 =?utf-8?Q?fFh3eX4Jy0OcpfNHiG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d383bc-35ac-4ff5-bab5-08df493a5eb8
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:18:35.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBKSDwikN9o4UgKpHXxSHsBcFtQk6iFgG7b1W7otPhCelbDwTRCTk/Q16MBRNKrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327



On 11/19/26 10:46, Markus Elfring wrote:
>> There is missing return value check from clk_prepare_enable(). Fix it by
>> using devm_clk_get_enabled() macro.
> 
> How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.4-rc3#n145
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.4-rc3#n34
I would expect that b4 could pick these two lines automatically when they are 
sent. Let me test this. :-) If it is not working I will send v2.

Fixes: df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video IP core")
Cc: stable@vger.kernel.org

Thanks,
Michal



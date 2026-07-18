Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021075.outbound.protection.outlook.com [40.107.51.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF337187B;
	Sat, 18 Jul 2026 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405487; cv=fail; b=uBWTXq0IzpYP2xxL+x+UN69edv8WOjZebbb1hj1T8oCPQl1PgbYD3Z36ACxtTOjhU8BlZKCLcua2VBZLzcNzkK6VkISteLrsi9oWIr7xzuWGa+5sh3HqGcKpvdp4iSwk3ydUqNpXvqZDcZqBNZkLTjosm1+dX3aMfqhFKpxbEv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405487; c=relaxed/simple;
	bh=N8hi+fQeu74z7Wt0xRY+tMq7XjrX5I15PQs+9FsPqTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nNYKqWG+cJ1qH4Rnuz/1WdSb4aNx/aAQ8e7h64PBFt9ISjUuXctKRzDZAMrDKeRbynM1a+J1UkqOIKRUuPezrdWIXFH+y06jDs0c3NpYxMtAEtrusG/1bg8EJjAd1Us+bzoK7tkARJ7m2PE8K7NhhcCmBLFOQkwH4ypHO1WwgUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=IL14DFqi reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="IL14DFqi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFZmc1xttwyAWlfyLDYW/WI6J8VFUspS5OPuW8nOomG3QgiBFYUtVD5DcuaLJBhprthoaXo5boDxMgiEFRdFacmUgfSzbs3gIjIn7BYYpfJQf3J+oDYGH6NDmirs0plu3lovirCyhOjeWuKHrd4hvixUjbhhZs3X6qlaDuN4vNQhYMmai8FB7w63j0I+CYcV+hkrxwfYehDLzjivJ7jvTs7j+d9+rLlJxt9CQyMVdkLcC9fHoQNTe67Vu7eeCNneH85SGBne/K8GIAriFmv4ZNTXapxcXjv54ekhZtXUQfjQx2Mil2B46K5BJEFLXQj2oY6HFyEp7yFf2OwYVtUBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k64FrxwUjxN49bWCIE7+MzJg62kEIITycdwl5Zv7oeA=;
 b=YqokoLgHsgJJaV2i3Us3x9rvQ4DCvW+fURu+/HpuzKQOqXlnPFA5CwUPa9GlNjb5j3fFoh6GlpitIPr5Vyr0xjIsjqM6zKOkK/aw11ep/BmOOqx5BMHb32meBXcFDRlABNASvX+wf6rkSeK1yIPy8Rk1Dy3/nWGf4kPBrHdMY833M3yYWfXwMHzyr/+Bx0kjjZmy6tTWnUFvMJkgpvOdPS5v/u0Nq3zqNrxKNELVilWkPQXuBDbx+mXi6nv4prSY+Np8YbqDafzKjv0ARJpDQYr1fwWPdC19CUw/jUjZ3V42Re9aMQcOJghfmWoDVKPL9I9BnbN8fSZLwv0iGDBEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k64FrxwUjxN49bWCIE7+MzJg62kEIITycdwl5Zv7oeA=;
 b=IL14DFqiG5AhnAC+p0AT9mShOrd6jat89imsB9j5VrRgGxTuhspTFBtVlo7hmZm6qZc5SCNOLRM0KfAbFFF7fPn0a1L6fuz7SBv564e4Zd+/2QGeYix/7lUD8tajlGijQ22e970ESVPhKSyDyk0usbbfgIjGTN3N5cciCROm8zdQFvoQktMMb3gyDhzPDUvbtCg2MQKmjjN2ZY829IYpdtbONhxTfLaqnAxFfkHO+miHUOHktdN/XZW5/nAZTsNiacEdjSblWowlCpepF/Y3eRPC5MDGy1dg1TEm1r+9MlGb3XCO3qsCHqlUlWGjW6ptyU1Y+iTdbvnvnCFSNwtwsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2078.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:21 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:21 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/17] media: i2c: os05b10: Rename vmax variable in VBLANK control
Date: Sun, 19 Jul 2026 01:39:04 +0530
Message-Id: <20260718200912.16001-14-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB2078:EE_
X-MS-Office365-Filtering-Correlation-Id: 91eb37e7-ed79-4840-8829-08dee508bbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|10070799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iUTqVrDtHnUX3UMyiHoOw0a89N91m4tQzZqtXzM+YVuvmUDZdygIsgpGWqqPWCnRQB7q+e4RMYTqRAT/a23m0t47acDVvEQVqEJTdNXH4670tfN05+7RTpxQniR74ntYtTXXj/Tn0PbMrj5uotZuvXdp1IHCfAn9ZKVwKhJ4Iji6UU2CeyYajDowWrfB3zQfwAr62J4mpeqNI5GG9k0+OTeK6ElFuibosjkNP/Dj4avRXbM1gRAQ1UIuXCIxjVJLq60IiWrHsPXtW4clblfew7DlJM+k8+9DbmNR2yQ3o+XP4Bex61zuhwmTvNrQhwlW0NqiJlhEm0IP2cBQTsHtbGvxK+NNLHlbxT0a+hI/qG//3xjLhoAe7QvY58XPvn9TTgSCl7mUz9NZOGlIcbWxtD5L+obCQ5hOaG/MsYiAj25JnMzSm/8IgE87I50xnmng2z1zfj32KXOVnZCnr2vGkWtmfZEEglxPMeXOtTJ8IYIE8yJtgKjDCfqbKPi/g/ZB5hcugASCzVcZcnGOj14w9lZsqHtW+cY4E0orsu31nkt3AFhfabXLdAlGm5SrjWGKwZ4VwZBG49FXjUC4LVEJ6os0/4tP1RbYe8xX7AxKVBC4nsutEPXt/mKpwdOrufLxGN8m+2jf56stPOtz52rIN450jdOKnMf7+f+uHOWvwjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(10070799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3N58uXFXd+7hHNV6vDVYuHtcyqOti9o33BcEihs4+XJAkOkZc2ZaWgLNQbD7?=
 =?us-ascii?Q?jFnbKgBdBK2W78yqsSVDfslR+D8XdTGkdhBRriEYNx8TRbKpzcMqda6NzFP3?=
 =?us-ascii?Q?eCKGUUIuqKKJIjdhmPyHLKSE607WCYmicxHo4ArajCqI1L2COR3XUwKNTBUT?=
 =?us-ascii?Q?GRtw4kP4xqQgLoN7tDYIFseIc+OV1RMGTkg2FIHdc2j6ExsekW1nVjaCVU2g?=
 =?us-ascii?Q?2cuozCFkFQZrCabkCyrNrCUmm83Gl75GJ8ofcVsRd2B/eQYbklo7TcykyOUQ?=
 =?us-ascii?Q?GpBqfpklwqImdNxQoi+JAuXg4uZqAOrG5wu6i+Eof1AMijlwPk38QWLeegcm?=
 =?us-ascii?Q?LPoR0356M3In9YefBqk59E7LRJ/49FD5+wFtuv6eJTVrbb2qxSdgWjW9WHkC?=
 =?us-ascii?Q?GZBnSJT0JEcYwRZbfTwnFajgnNh4wKVTKAjrDNI2/CdnoQCGbMgONO5jTY7t?=
 =?us-ascii?Q?BYgzEgDd4Zn+VYcxYGpCsPPdaQXJH1VunCOGDFmnUBJL9rVyFfqfXVh0JRPr?=
 =?us-ascii?Q?zvnm0/7NJRBaR7dpry0I2jY5kMBFrJEdIy2qotXLUrELBhQHL5Chgz8HEyPg?=
 =?us-ascii?Q?3KWqbmWQm/dfu8EFe2ADs+eo/3Bqfdhyd0YYvXNqgrAwBCkNILHwdF9VcAdu?=
 =?us-ascii?Q?hlhE/xJoTTyJEb+Xl8QwSCKYC1WD9J398SL1172OUMzV3h9148bcr8DJyvSf?=
 =?us-ascii?Q?kLgPnv/dtzULdkEBsFuj0mEcrIgVpV/mi7VcmQlId6IDLVOT1P3pMzLI6wjx?=
 =?us-ascii?Q?IOqxgXk4MfAlALySFgMS70P5Yj4hJLGFgHQzKw4j9pYXCSSBSgwh2KbE3O5M?=
 =?us-ascii?Q?NpdnnRVWVdQ4lJqLm7ey1v4550gaYU6gk0OBUMS1wxHiF5Xuo0Xz0iCsWqG5?=
 =?us-ascii?Q?ssD3chopuQgHVzQMQgiUh4zRdVQil1jn5B+gamVapd0lwGd5bO/GKdwnczy6?=
 =?us-ascii?Q?sA45aUz58jfje7L7xsn1WWWqRGUuBQlpIFGTSg7WJDXLYybzWZYmJSlig7fH?=
 =?us-ascii?Q?9M8jYGfxTwHxscxmbPS5BH9V+2X4OW82QRhg4TsvvVMChOjNUMNKK5o5XSYE?=
 =?us-ascii?Q?5FRR2h7Kev58u3z51Ih6Q4s3FdmNr+yqmc9QaxVjAZ91cjjOjpc9nFM7LGqv?=
 =?us-ascii?Q?4Y2HZ1xgm+Neo80BCH5zoq+QEvKlvcrBdokY5/MbKXjWlP4q70UEMklds6ai?=
 =?us-ascii?Q?B6egYV9T6RDMjYfkXgFDnvNIjSVxSIVLphxzmYjKnM+WOIDjopzIpxvPDtby?=
 =?us-ascii?Q?Kc8IY/DC9b77NPw0Va5eLZpyaYiA1L6HxNuSTxrUtm4UDETo6UF644u5SGW9?=
 =?us-ascii?Q?Vp9mZYtIsghnZzd05DrJnEsY/S4Rn1vxdvIXZSIFuEABPx9AEu2gGUsmzI9m?=
 =?us-ascii?Q?xRYo0Txpd63TYcsXvyISjH3qgkFOVZmq46YnHJSLIB4UuWhiwMPclAGkbIFC?=
 =?us-ascii?Q?7PmmqGLADPgeQ176vdTa3YwVFAeO0/ZmgEvswu3yOrjfLZA7vet1o/ziiSVU?=
 =?us-ascii?Q?TzX+1ZrAqvXpBy4e3LuYSkhYlqSyJIWRE6AGA7vgIrtX84WhfmQ2FSlP4M/W?=
 =?us-ascii?Q?GDMFYHxxEsYWDPlwPmKzkIm5TZoWeDgGD9i6+K6a01/GkAD6AHZ6jw46/z03?=
 =?us-ascii?Q?nZtnXuk8YeXGPuLqWNNjJvdnMerzbADLz+Uqk/WN7318LqwXlkhkXYYqn5xG?=
 =?us-ascii?Q?JbcNQ0rr8BEwXyAce/2WWcdXjwbFFCTeypN3DFV/7nbIH7eAjfPEEhil0zOm?=
 =?us-ascii?Q?NHeBBjMllVaa7w65GbOg5T8hXKhKK7jsrAWL+cpkQ+BgcJDLfJ2F/tlrkFnL?=
X-MS-Exchange-AntiSpam-MessageData-1:
	+tL1elNEvJ74CIoXwMk3phKGnB4kvbvhLATJlUPCzkG40CHvsYYBOWrM
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 91eb37e7-ed79-4840-8829-08dee508bbed
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:21.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZH1b1E2U/TDwjs0gxiInJeHnIRdUGmoUblJI3BrKXAR7kpZaMQs6R8tfv3ugXejTynLA5oK6PX0RBdxsmoBEfhbKVy4cgeCyzUMe/ozMIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2078

The VBLANK control programs the sensor VTS register. Rename the local
variable from vmax to vts to match the register meaning and improve
readability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 82a96081fe21..876186b22f5f 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -750,7 +750,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 	const struct os05b10_mode *mode;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int num_modes;
-	int vmax, ret;
+	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -779,8 +779,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		vmax = fmt->height + ctrl->val;
-		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		vts = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
-- 
2.34.1


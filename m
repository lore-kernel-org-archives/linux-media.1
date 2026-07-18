Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020125.outbound.protection.outlook.com [52.101.225.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CD336D4E1;
	Sat, 18 Jul 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405471; cv=fail; b=nXq2ItG89SVHZuZDDB4OvVKs4SxBWcK3dCyPEyS03WLPAhyEigeoaewv8Bznfnp6cGrfjOfVR/umyBN6KkdCt3k/gYubtF4vBiKQTdU+JpBDkfvrRQVHwcaWZL6naCriIxenbA7HjvF8PPho8b/z4+hWK7NeE/Ufr95Ncr2XiFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405471; c=relaxed/simple;
	bh=9rJE0g4yJHGHvikXqZKw5GwWuZYYbbNoz5dC6lkiXik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Srg2dOyf0tQupfsDk7YKseWb9ddK1s7BY27vd82GtQ+Dh4g7pEJY74gCViAbGN0ruyXfaNB+4V8ZAY65UGeltVBDoAjRUtDcLG8exPxYqe7kTe34HWPm12BkxLPtMY44/TiICfmWXsju+24g/+rnsDWeug2/01pO9d6pfQZLZPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Iw5LR6SJ reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Iw5LR6SJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYzaS0DI3sSVU06MI4GNgLmr7HQ6VgvEgbZDaEJPwqvqUB8edCULsbiZ0tR8sNE2yI3LoCAnYIB/qT/Q5WAQX2xp+S946vahw3TZ9AvfFh6LD+2frfr5CtJpHJdCLLXFTeB5zDQnHQ7r0MExQlQVYGoDSLEmoxe9qFhttjiu/nv+X64qcgCC6kl9HlkvURgi74y3S4JnInXDDdCwpFm8nn8PGJID0ts9Kzcj54mmsA1Kn+dfciA9E30pgAI5XFB3E4En+SXWZsl6Dr9bUu3+h8pHRcdzoNry1Q2hRmyeckPCzJjdbWOKwRcXNu5F0JjU5w2o6yG8zBtPgV8LTAEXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ATgSpa1bA7EVzME8BH6eq2KERIMb69wPRvEuP4GA6k=;
 b=D+jiqy/4JUpOl1ztWvEj6QVNCBqWxDBExtfG+4nX7M9QGfYOdL2r+dCpD4aPqXktsrkuG8h5qPXDQ5w0NZQtV5EOhPvN+dhYOS9j1WMauWtOHp9ykgJ2aVHfbxOTJwb6aKKZHUlEqmBQzJzbcJeUrBulziiyUxtgJU3Nq8ySyMCG0i8Sbbo4fIaFKLCnMaN4wcCyrpUpNr0UK5xVWClPNFvd3hdzOWSUSf1oEqrwbNJuyjQH7QG95cOdOPJC9KfNF3eQ3QldDx+UJDZKJLPwXpemazB46wQrnWpWo4xb7c0JbGTXEYzLuOFy2QzspYDUmkaTmQgd2Pqwko0hSaE7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ATgSpa1bA7EVzME8BH6eq2KERIMb69wPRvEuP4GA6k=;
 b=Iw5LR6SJ/B9jftDrDmOcgbujyZqoZViWF0XWhh8CKT5i2lEgaJ1bT3d+wcmtl8N7vY9A/1+jGWUvEYh/Ll1jZzzx3GxL9664DIC++SAzWbrt4Nyu3Il4j5DAeaoQXTAkmaPugvBNeMDKgyYTgrCOyuV2ArG7i2zQpkH0N1tH7NKdskmp/1sKBk5Qeyo7vmSWtLjJUU/bPke5rqAL8VTOYSENIDKFp9/hz6UuQB3mujigtiTWWXdAjY35Q3sy42TkMrLb2giDmEuBkO5m4OqI+zZGUGGnciwrey62ofQ3fsCOMts7YGrzPW6S3eZ2hzFPVZjxw6LjbqaZSpBNedgjLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0774.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:06 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:06 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/17] media: i2c: os05b10: keep vblank and exposure range in sync on mode switch
Date: Sun, 19 Jul 2026 01:39:02 +0530
Message-Id: <20260718200912.16001-12-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB0774:EE_
X-MS-Office365-Filtering-Correlation-Id: 96204b8e-9752-41fb-d318-08dee508b360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|10070799003|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/T0w4LLd1Ybqeyi7yxu8fenCwbEUg6hUsunmTNlZHAiXh6tDBWotf1tGeqp8obgizyI1j0TPGpQ0qwoFnetKIBXtWB4nrUDzh4XQt4QKeDf+rw1z8JRqNbziU1ABBONZVtbKhSdV4KA2AYoQ+a9pUEYPL+030n10YU+vTpXMSTZgguSajPfo2KXWv5t2Z9fp/kpic1oTlE1roYryjKA4leIjSwrPYfHCwDX2jphiRsu3sJEqlcrNxOiJfIjKNB/13UcVtxA8FgTwRQS3TzfVJhyL7sfTL1xTq5uHx0YAW9y53WUZy+axHvPhj1FGFokThfnemlOuAPSrdJxCH1bekIwoskVgTsRr3HnHUG1vZfAZ4rDnN24LSiu82Ewh3rfE2iImq+MKjXJ1goZaxjFdeAEXvlWw/AGWqmGExQ3hSV9RrPCgs34L3MPSK8iQJER/QbCgtJGMHqQHtCP2v8SgheDg3cXBYIiALpJLhGI37h7cLGlfJwe9GBcfl21RKpcNi9h7t1gOxUsm5E1OFAjgBPB/vmCulJBh66tsNENZhnYyLPQi1QhbDHvq9uNzCjhHhI59oddlX7Jq4ltPWVdaF7H+vV62pHnPHQ05KOojxhcAQSx9rsPt1Yi5IhrfGPklEOspqVzBu09qGBwPeufAcSd63MzMU5uI5nssmvDdLjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?swEJrSVr+V7o44nYFAuVhrtl6viL+YgKxF8O8OF2ZkPcoICzioNuG6cmqU3a?=
 =?us-ascii?Q?EU6zZK81x50RVHzqJimbSmjN+JlM0YAAzItcZlyGAKfDO0uT4f53DAw6XkrO?=
 =?us-ascii?Q?P7T4Zq1vW2uSN1zhmheFsISIVSVLX9cqqRv0Jmzs2WLdkfEVOOj5uMW8Zyxb?=
 =?us-ascii?Q?sJ0uNDm0IBjUGsn0ZarpYn8PgIdx5+z5WLCrULRwyzFAtYfTGeE5fxmlBGHM?=
 =?us-ascii?Q?Q1bnfxYuMiz1w5I51wBqSNOhItDDCKqYnryUptExD8pipn3ZQXFOrvk4URvs?=
 =?us-ascii?Q?E/mIbex5+/yH0WZePDglTK5u0y1WFpgiOXTi9GeknAqU1NNlGdLZf3KCDhOQ?=
 =?us-ascii?Q?orlBvS8tkVoI8QMjUpUWf4/WMGyFDuYxfqhyPo8dBYJPiNJVsfl8XV+Mp1PR?=
 =?us-ascii?Q?1O9Qvor4csyXkrjUW7GvInZkdR0eJC0fjDENi35cxjem8Hx+lOpPbyWEv4F3?=
 =?us-ascii?Q?uuT/MpOap89IHEqIJxsfzB9U0+RDF8KeYA7b+oXk/1sZpMW65SpUQJlfVdTm?=
 =?us-ascii?Q?1uSwkoASESL6y9pteN72NHAQg4xvpxGfNkMOcGCi9u9lf4GeQzdNe++uC5j3?=
 =?us-ascii?Q?l+GV+62l6s+pOeRdo6nvkTxozm2Oq7DuFe35sKMhoCLyyP4TmKwVyJkiLG/3?=
 =?us-ascii?Q?GVUQtmhgGlsPvtYfBS5rLU+xupyDltlwM2F+5Q2m5M7GSPK36nPiKCmGZPoA?=
 =?us-ascii?Q?9lIhDjoWu1OGczLm8E3sUXqfzAM8FkrrT42+xYJc0qBO1emgTs60APg8PbCe?=
 =?us-ascii?Q?cuVRt+QUlBAplyKZT7C7VrAJQE8BM99tBivqsJiMIed3Cx8qJUk30qbUHR6i?=
 =?us-ascii?Q?NkXb0N491yxbY1SVEivo0RHPJeCeF4wASqc9ctW5KkklwPs71UEK6sp9l1Tb?=
 =?us-ascii?Q?T80wy8rpzBZUrLWkeItDRny3AZDjV8NQAxdV11aofAty3pV/OR1gwqZxqhZL?=
 =?us-ascii?Q?znu7tlqq0GVZNit49sV1Me4+zBKgGGs+8EXdU1M70AlUzY8ltxbia1uF5EK3?=
 =?us-ascii?Q?/lwGE0Kx84NtNxkpwriJZNWYypeJje2dg2+4CAhqd2uxt4EU2xY2NX9thbjO?=
 =?us-ascii?Q?A5Mi9ZrLsBG5N6sPUdpoFQUaTghBlGBehogl5/VnVMtR91QH7jqcMyx/7urP?=
 =?us-ascii?Q?mgQZ/Rq3s5RgPKySe+3u6LOxtSL5/KZAXkqVTpmgfT8LAjgPtchEeVDvCUNK?=
 =?us-ascii?Q?ja4XPyAm2yukA6N6IwyRrSJEfLaHVc/SEa1/Zo1NqnZ6Ga6RH5+EMjOgDoq/?=
 =?us-ascii?Q?U+Cqkp/G+tQ4QLNbVlLbFZVXu/CXLoLmNhigq8SguAf1yUrH9Wxtpwyns5BO?=
 =?us-ascii?Q?AibvTWNVPQEP2+ieaZltYnpFEGXRSNb0pFlRDKQwQO1N9EgKhqiJExicWfs4?=
 =?us-ascii?Q?5bIzpgte2/KSabJjBtsQW3fRwbZUeuxRX50JvgYB8WauZdjPXU3uYlRY7QdN?=
 =?us-ascii?Q?uMW76kI9ORIv6JWnZraV9EJctoroEKCbhj1uS7mNgdYJupGeKBtiMCZiqanp?=
 =?us-ascii?Q?voJj/L67eG2MQ1Y8p8nE3434D75H9z/E3gvs1y1Glp2RUYoiWCq63SDfxeVe?=
 =?us-ascii?Q?YhXQsCZ8BhUGosMYAsqlvgiZBaMeFOcGTVk/71co1SSsYCmIRW8OKlfIAkI1?=
 =?us-ascii?Q?l6a+cN7TXrbCDyDDk6R7Mttl8lFJpyQchNSMRuStse3dBISUqluxCREXuVLe?=
 =?us-ascii?Q?Ca0q7QHWCfw9e9urv0OWClPDLxo+UqYaEX1l5yiXvrOrQjvuvvcN+7wr8Ylo?=
 =?us-ascii?Q?8mXHjoX9/ryYZwduxzzBz4EJP6+8bI4pWDSwVA36DpB8KDxV7Qau/10JvsPX?=
X-MS-Exchange-AntiSpam-MessageData-1: LdESJtSxN3Rhgtak67q1gcyNgJmWGJForJ4=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 96204b8e-9752-41fb-d318-08dee508b360
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:06.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8PvTl4DzcHQjExd8veLNluzDoxUuPbaKE8Iiz+qmoA3hRWWN2bNyznewH/wqoLv80EpvCUx3B5qha3wkHNIgpH3u8amSA+Nxq38Omm1pas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0774

Update vblank through the control path on mode changes so exposure
limits and default values are recalculated consistently from the
active mode.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index c54b466656aa..d124db74766c 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -745,13 +745,23 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
 						     struct os05b10, handler);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_subdev_state *state;
+	const struct os05b10_mode *mode;
 	struct v4l2_mbus_framefmt *fmt;
+	unsigned int num_modes;
 	int vmax, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
 
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
+
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
@@ -759,7 +769,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
 					       os05b10->exposure->minimum, max,
 					       os05b10->exposure->step,
-					       os05b10->exposure->default_value);
+					       mode->exp);
 		if (ret)
 			return ret;
 	}
@@ -842,7 +852,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 				      const struct os05b10_mode *mode)
 {
 	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
-	u32 hblank, vblank, vblank_max, max_exp;
+	u32 hblank, vblank, vblank_max;
 	int ret;
 
 	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
@@ -867,10 +877,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	if (ret)
 		return ret;
 
-	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
-	return __v4l2_ctrl_modify_range(os05b10->exposure,
-					OS05B10_EXPOSURE_MIN, max_exp,
-					OS05B10_EXPOSURE_STEP, mode->exp);
+	return __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
 }
 
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
-- 
2.34.1


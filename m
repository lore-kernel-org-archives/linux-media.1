Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270500;
	b=4n/K5ZdXZF2yIB9UveRAQc31u2DKgg4a1ZPWfUImUvQuNr1pfZ6LXsMHWYBV3GsYr1h2
	 LWKqdFzAJHOHcF7zgcRVQpjbsKUTLTy2C2H2Aihn2KKYjGxGUIOwxsdki8f9zpko5uLzh
	 boM/OOC+X6MIc/ni2OhluKiUqFXh8qULk8DMX4ybhLBtKeYfva1QdRrYHlXl8zntbk9Nb
	 LfAjnHpEA0AwQ5sjqOhz734DrWVg4tyhW/PFAvjAvqmnY6keqAaGd7ZmdVs01NJj6eI0O
	 1D/d26Rq0a/LMOgvtB3sCAPhbrCG1t9yHVG9MfSjHKhHwcumdGA12Ch7p/a/Kw1cPng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270500;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qeFDA0g33qNnVLiOs7XJmWhYD/xbVO5nGoExl6jul8A=;
	b=qjHl47H58ieP/Okfd9yl8Dwel4iLM4r+IVOTUeRuvTwH4/iDRoMe44mc7oUmsxlLxdh0
	 lP+SW2YJ3xSCYxxdcFdu1wqBa1MyUJ95ZmI2hS+Pgz9TDvcM99bs7dCYXxvCBXURjF3tz
	 FqtnAbKm443H6JHEaYYvquLTXk4+bihTDilJ9tHARoyVn9K7gOFKgBxd5nBvkSKOPicFz
	 YMM6vfGuCNxbMVgJ0+MEB2lSwJDf5GFqNZb0hsQM/6X+O8n8V9GcLP7AwGolwoL4mKqSr
	 b/MYtSE4UDfLp4qgK04LLGHZ6LFAGfVxdRGacXfVXZVm029aiXYrGL486ga6M7RIlYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bgivD9dz;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5476D606A32C
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 14:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5476D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bgivD9dz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qe
	FDA0g33qNnVLiOs7XJmWhYD/xbVO5nGoExl6jul8A=; b=bgivD9dziIRGDBCSR6
	DCz2zL84uf3N8n2/Ls2ItAFJKGeb1wgJmA/j342kFtuKrQBZ9+NXB5Zk3Xo/uG/5
	+da8iYfoFxSV8oou71nvdAnI6VqL41a9qGqhyltJTUdeRLZKQS+W07f4nBPH/XFN
	PmSVo4sNUFyYjQagehLqegXxM=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3B5c2pwFrJohbJQ--.61736S5;
	Sat, 21 Nov 2026 22:14:18 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH 3/3] media: imx: allow setting FIM input capture channel
Date: Sat, 21 Nov 2026 22:14:11 +0800
Message-ID: <20261121141412.319802-4-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121141412.319802-1-shijiaqi_develop@163.com>
References: <20261121141412.319802-1-shijiaqi_develop@163.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3B5c2pwFrJohbJQ--.61736S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zry5ZrWxZF1rtry3Zr1rCrg_yoW8Xr17pr
	40kw1akFyDJFsI934Dta1I9as0ga4kKFZ7WasFqw1Sqa4fJFn5WayFya4jkFy3AFsay343
	ZayjqrWDWw4jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEasU_UUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC8BoTZmsBpzozOAAA3j

fim_s_ctrl() rejected all controls except V4L2_CID_IMX_FIM_ICAP_EDGE
with -EINVAL, which made V4L2_CID_IMX_FIM_ICAP_CHANNEL read-only in
practice even though it is registered as a writable control.

Add an explicit case for ICAP_CHANNEL so it can be updated, and fix
the wait_for_completion_timeout() continuation style while here.

Signed-off-by: Jiaqi Shi <shijiaqi_develop@163.com>
---
 drivers/staging/media/imx/imx-media-fim.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index b6467e29ac28..300635a3b552 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -58,9 +58,8 @@ static void imx_fim_wait_first_timestamp(void *priv)
 	struct imx_media_fim *fim = priv;
 	unsigned long ret;
 
-	ret = wait_for_completion_timeout(
-			&fim->icap_first_event,
-			msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&fim->icap_first_event,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(fim->sd, "wait first icap event timeout\n");
 }
@@ -75,6 +74,8 @@ static int fim_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (v4l2_fim_is_streaming(fim->core))
 			ret = -EBUSY;
 		break;
+	case V4L2_CID_IMX_FIM_ICAP_CHANNEL:
+		break;
 	default:
 		ret = -EINVAL;
 		break;
-- 
2.53.0


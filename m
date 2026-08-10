Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3A940F75A;
	Mon, 10 Aug 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375350; cv=none; b=ZS2ePmTGMy1rCnCtxeRHZtVPBQXqmw2URSa06JBaqnIBOMYiQtI0oD50wlynLy8XPSD/F8KT+31iyoOn7Hl8uwVdfvLtVm2fyll/5lBhfni6Dnzi5LrNVD0pL+IRE2Y1siPhKVVBa+67on3FDsZhUk6H1Lh9OO3nLK6tuXk3dEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375350; c=relaxed/simple;
	bh=7pR0JRM/UsbUq4mbJ7zowp/xReYV2Z8VN7p8X+cIgy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ou5L3TBlfT/buxbq2NutiQFZL524xirdqjwQuUd7ZC4wIRc/bS0mtEPjJUSZWg0Ts5/yIDf0TmBC9HIvuMtTRDl7op7katGrx/JQDRioLYE/Ydm/YhzBNnaZKd8QbvUey13KdC0hrvqn4XhCoRrLov6pS7LBDIQxRyjyEuR+zpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DhTMRXbA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DhTMRXbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375346;
	bh=7pR0JRM/UsbUq4mbJ7zowp/xReYV2Z8VN7p8X+cIgy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DhTMRXbADQpX45fzJ0DLCb+ZD/8o1IwA1RVlTrvWMiHd+aKyz4IKEOzuaCUJZ/VXL
	 oPThHLjIsDZfHUsTd9aeQ1wZ12TeWadRFP/E5LY1OVzOCuI2+axHomRu048HmWzWMG
	 G9eFR8e+KMs9HO1Cxrhcmnr4y/GxuIeMmICFUNhoBGbFYAclR+Ngap7fCBabUhzcLh
	 AGzL2nSknPns0EBv0ZQC5NtbW5DgPNQzZwFt7ZHJccPZBVM5EX0pukeQXo5bd33sIe
	 8skzO/Z+dbweRwmOspPstIGDETy3ops3WRIzgNaKPAtHU1rb7HMq/qAn0C1w//9cSG
	 DgLYIYfyfw5Gg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F12317E0A33;
	Mon, 10 Aug 2026 17:22:25 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 10 Aug 2026 11:22:13 -0400
Subject: [PATCH v2 3/5] v4l2: export v4l2_m2m_set_max_parallel_jobs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 14ac9c85803d..f6f8864f23d2 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -128,6 +128,7 @@ void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
 {
 	m2m_dev->max_parallel_jobs = max_parallel_jobs;
 }
+EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
 
 struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
 				       enum v4l2_buf_type type)

-- 
2.55.0


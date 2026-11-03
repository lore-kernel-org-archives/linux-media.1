Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691690;
	b=gn3PCxOKBRu65IpumLGQXvE3n9PLXM4j1/eiigKVX3fKDJh7iAXGAH+N/NCIUDods0Qa
	 YblzkkwFpzQ07Q+XmATFJTu1SRNQ90l//gS7KrRy6wLwxMEqOnAA3wSgBjJdCSnN7D+oc
	 kNrPqMRB+JPNeiYuaHBsrlkQtphErkKZaVv9LUrZEAP8P5j5MmEcHpNHlcdCAKy25eoeR
	 ILW5izC8RakNoTa/9F7oGoWDzKlhOSnwO5Iar6QvvDPksY7+bNBMt6j9InBlEwIUUIixD
	 lf/grhqVCpgwesPtKUWAtXfgqYwuJ4NKf6n1nbAhMYqIixnKGxgMlq0hJ00nZjZcpJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691690;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pWV+MHPJuJet8vQm738jlBmMlNX7vo5rGOnH975str0=;
	b=DswMNzz8wjrgbvHWRkomuGnx908fKHaUjJRVcNfu6Ud9WplCIz0xpLHHANXBreJGVvTN
	 H8szRmSHdFdzGEG6qjRs3Uovluok27bEPvqMjXx9zgjwoStHeQ/L2N/PRvNoGzZX5T8e9
	 prxnufejTHrts2L+xQN+W/Qdgprlv+yqY57t1VjOig86+CGOKcb1xxzzhi7w7L1u73D8G
	 nlJZ68Ov92B2IT2C8aW+asqqf/rRwWrFIxs/CPS8qfrsgfINMvCfRrZZeNVIZtBue7WGt
	 NhQeBEEQln9bWJYSTSgmNfwS/l9q98O7x2Bf80ycQdP8nxz+tlk6noy8rNZEztoHWgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EFNhL9f6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92817606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92817606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EFNhL9f6
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFFDB4FFC;
	Tue,  3 Nov 2026 08:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691539;
	bh=4UM83WgUUmLXdUmJoKiyVW/Tt6ThP1bsffedn6enb1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFNhL9f6TQQ6m77Yh7/XVMHwAz7o/w/f6MxG0AoVEL2sM94ec4hBc84VWjYYuMcym
	 xGYI7AcG4pGWMMP86yE8pyGjtRBgPVmGEAHlJ9Zk+8vaYfv4HwxALA69zPE/ZS7f7i
	 Ltxk3VI1JJKghQdzpdSlC4OhsSEH+pCEjm1Xgg7w=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:50 +0000
Subject: [PATCH 14/16] media: rkisp1: Disable resizer stream before capture
 device
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-14-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=4UM83WgUUmLXdUmJoKiyVW/Tt6ThP1bsffedn6enb1o=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZARU29b5O2lGgZCbTA7WMrBfcYKXkuVYKTgZ
 jLzBR7PUomJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEQAKCRDISVd6bEV1
 MiktD/sH70tz3ItYN/GwbHjvlnGrBMrBjAQPPYJFTL8pOLNc7v4U4roc6/YkoZxRQwHC3g5+Pv9
 BkLdMmSmGKY0Vlj8oPxICBpAuWeVdZLKChgDund4yoOhYRDDumAnMEEHP7jW8CHRV24+wpvg4g8
 XMtueUp2nquV+PmMAHyM5lTyHwyKjU+MsIz96Ej/PXQiF6R1K9HOo0nILqcRS7CfoGCW71V3Iy/
 UhXyZob/PDXAKRQj4e9PTDrD5jdM+TdGv8iLON4AnqDt6p2gyxQfTzuq6ij4FCEqgwvCKBzftHs
 uG8x7dUNCUoQRrUeQjhkvZUtktlglFsaeWymQ6GDUl23WuyKd07gqrgEncCkhfV04zMbe75jLgH
 jlz730J2dtUAotZ4Pox9svg82Tqr+fXHC/wJwyIRNOp6vwSbwwN1/lrzmO+79ZNxtn9q/kn0JUu
 RyF7dVGl08RfvRJZXGkB/c7WIY743UpO6q5rvrW+0D+Ss88JzqbViU0aYzHICQGHepyw2q1YLYx
 mrDPr17/t+o2fFT9gNEenXb2+4roRshdNkg4hWarIdG/O3eNDk3ThWueQzggOHGp3B+X6zoFch7
 pqWk8fGc9EoYV6aLYmaisfINMqi3Yn2MB8oQQsSxnBgFvOd7GufdZKdPxfGjFFIz29TWOjQTGwg
 Zbj+M7mZOBS1J9w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

In rkisp1_pipeline_stream_disable() the current implementation
calls rkisp1_cap_stream_disable() before sending the stream off
signal to the resizer subdevice, which will make its way down the
chain of subdevices to the sensor. This means that much of the stop
operation happens whilst data is still being sent to the ISP. Switch
the ordering so that the stream-off call to the resizer subdevice is
made first.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 84d66da484df7cbc29700efc433b1271d594ff78..3204f5afe3bbf1a5de88d57b50a120e716b1345b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1066,9 +1066,9 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 
-	rkisp1_cap_stream_disable(cap);
 	v4l2_subdev_disable_streams(&rkisp1->resizer_devs[cap->id].sd,
 				    RKISP1_RSZ_PAD_SRC, BIT(0));
+	rkisp1_cap_stream_disable(cap);
 }
 
 /*

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795477448;
	b=a3UbUkB81z8qyb5hJ5b3f5boFQhcAaVhheHF/1K0IfTFOkCjaplGuc5vuM6A/sKXXHC6
	 0omjhlHnKrBGxygP/k7QEDibatfrDnECIFyfOU78I8id5xcRPnjwimewftzyr0kdLIrAH
	 q4mPs+8Zp/ofQPd6yWfVSk3nWClkBOGEmq35/rO29McMjblnZZccpPhZDjbLwrpCjKLOg
	 +qzSBokOeol15eb/tgRFKIRdeue9IJIvG5SQG2XjpxLOLtKDtGUuqjD3vZUjvkwY2+Jnr
	 MbWyEgx2iBk5Cqk7h6qRSz4nV+EoG58Ki5U2mYr7+DFH4JmZ8adctL31yatKoUGm19w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477448;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zm7/8CmG+MEvmliGH31CDDX4MWFsX87olFlbu//kRGo=;
	b=qSWoA+BS7UuTHkqvEzkO7Iv/E+RdLo0JWatmCLWV6rzDXtBjeUSN9b48SBcB1D600/+b
	 RVTNmaHM6EMvAFGwch8c2zGlHeW40LH9r5i6APzDHRSisdvwmczpB39bgIzDJYfli/ZRc
	 l15Z9BQhp/Bth3eZpdgGWEgBV5Ilq8HUxefPl+58pW0+4/qR9cjBLJ92ra2d3YpLpUsYh
	 ZlW4Oc77oJoU5fmtSuMmZEDIO8532ffYq3bH8brcVipoTpj3HwPab4tuObmf02cruGrGp
	 CUbP6mn6+gOsUzHje2hb0pKOd+I7WPcZ6dLd73WNVSl9w24ZhFIO4kKDUUWfTM3KSkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C22KA4Fq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BC0606A31E;
	Mon, 23 Nov 2026 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C22KA4Fq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795477448;
	b=T/iHhuOwFNVhMpRLBHWlxoMoKJS0i1xxnH9GWf4wkLPo4lFPIfqxJr4KLz0rDyHiqKkd
	 SpHBZMPTqYup1oOJ8xMmfKph2le55i19lt0CYmN2f9Qf8BsLxBI5KDkciJteE8zcJ/4MD
	 fpVv8Pj8xyiFhJUu4Xe831vTT7ZpAYuvsUXzOtfVuW6TW2RiUmH+6vYVrYcKq6s0z6rvz
	 4Hi4fhu1STIHN2R3DRS7O43WJXxETeO4gc70272DTIFBCwcahkEtZuiRtTVh125Wz1LH4
	 en+287NALGBa3QipayvzeG/Et5jI6wdzqeXQckotiZh6tRq91hp6rr6JfOLqZtt22IQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795477448;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zm7/8CmG+MEvmliGH31CDDX4MWFsX87olFlbu//kRGo=;
	b=DWdCm6iMte9BnecKZ/TwcsbJ5K6r3qGfCiNJeM2duF5x4PL1Nr5ftwbmLLgwqcn0QQVp
	 x+JaooOHOLbsZIzpTEKTQnJI/gzX+ynGTvjSBE7vltdOCzJvGpOV4oWtPmp8VBuMI7oKM
	 icYzNwzvPn5rddYE3dVkc87W0V67sgFFSQQ9wyEhEjPpQULO6hnKEq/PxntHbgANDG1J6
	 T159zH7Aotk+vvzexKMclm7nktmL9Trb2tM+rISsnM/VmnFgVzYljlyTU3cIuZROIISlL
	 fiRJTb0hg3GI8CLWRcqtZfHMbzuhjp+ZruE9nH3fjF5SswwrN5OtDX5HpY5dkb3qMIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C1BA1F000C4;
	Mon, 23 Nov 2026 23:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477448;
	bh=zm7/8CmG+MEvmliGH31CDDX4MWFsX87olFlbu//kRGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=C22KA4FqsSCWMOG6gvhjft4RBccEnjcbxI/6L92v0m+1/8fW2wEL7k5LsnppOx1pl
	 cDL8VQtOJecHBUiCJYN+clTLDgG1kebpnrN1RGtaC0L7DPsCxkuWr3ni1rvjaaxK3t
	 1ywk45tOKRXLk1Rxgz8GyzQVMKjbqKTZE7qUxMXsDWvJC2kCYXzxJwDy+W6VE0qWu0
	 TkaRnDn50dOaiB35sDclexdIp3sd6o3i7R2Yxv/oMauKOeaoPEo8wkAvHXoCxBOdlJ
	 h5txmssOe8Xcrqq3bCRcleuzOZCf3AGmkS+xjR4WSdVbji9gOnYHut/mgn39ZQYO9i
	 zxP5pLJO+u8/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B95134C7DE;
	Mon, 23 Nov 2026 23:43:55 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:43:55 +0100
Subject: [PATCH v2 3/5] media: qcom: camss: csid: release parent device on
 power-on failure
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
Message-Id: <20261124-camss-fixes-v2-3-231a5523cd59@gmail.com>
References: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
In-Reply-To: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795477434; l=3176;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=l8BJgwb8YH+21l9KNFz5RZ28SzemG6MQfy5k8gd73tQ=;
 b=s7oghpaIu2xADB1QXAeTWIK48qDUUMnAwrsIuSoJGUjccBmhoiFTZrzzjGcZ85sfaGsrNypU3
 Ou9MMu7oISjC4RWhMzzAvA5alf0KeOc7BiGP5YsXaSIm9V5vnpMWtuy
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

csid_set_power() acquires a reference on the parent device via
parent_dev_ops->get() before resuming runtime PM, enabling regulators
and clocks, and resetting the CSID hardware. If any of these subsequent
steps fail, the function returns without calling parent_dev_ops->put(),
leaking the parent VFE power reference.

Consolidate the power-on error paths using goto labels and release the
parent device reference on all failure paths.

Fixes: c5af8db84c01 ("media: camss: Do vfe_get/vfe_put for csid on sm8250")
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 48 ++++++++++++--------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 51f2090..e67edc3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -682,7 +682,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	struct camss *camss = csid->camss;
 	struct device *dev = camss->dev;
-	int ret = 0;
+	int ret;
 
 	if (on) {
 		/*
@@ -696,44 +696,28 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
-			return ret;
+			goto err_parent_put;
 
 		ret = regulator_bulk_enable(csid->num_supplies,
 					    csid->supplies);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_pm_put;
 
 		ret = csid_set_clock_rates(csid);
-		if (ret < 0) {
-			regulator_bulk_disable(csid->num_supplies,
-					       csid->supplies);
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_regulators_disable;
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
-		if (ret < 0) {
-			regulator_bulk_disable(csid->num_supplies,
-					       csid->supplies);
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_regulators_disable;
 
 		csid->phy.need_vc_update = true;
 
 		enable_irq(csid->irq);
 
 		ret = csid->res->hw_ops->reset(csid);
-		if (ret < 0) {
-			disable_irq(csid->irq);
-			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_bulk_disable(csid->num_supplies,
-					       csid->supplies);
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_reset;
 
 		csid->res->hw_ops->hw_version(csid);
 	} else {
@@ -745,6 +729,18 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		csid->res->parent_dev_ops->put(camss, csid->id);
 	}
 
+	return 0;
+
+err_reset:
+	disable_irq(csid->irq);
+	camss_disable_clocks(csid->nclocks, csid->clock);
+err_regulators_disable:
+	regulator_bulk_disable(csid->num_supplies, csid->supplies);
+err_pm_put:
+	pm_runtime_put_sync(dev);
+err_parent_put:
+	csid->res->parent_dev_ops->put(camss, csid->id);
+
 	return ret;
 }
 

-- 
2.56.0



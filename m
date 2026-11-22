Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354562;
	b=KD0jDsvx1MkJIoRiymg0P7bk5aYe+wPB56jUGl5lvigEVREvegCpVwWtcrjku1nK6NIG
	 CZAJKzcyswjPavv3pOlPA+6chTRSyEplM3iqTS8lY9Ao8P3cMLC8PCHEpU+QgnzrXvzGg
	 VelyiMAvnkChrnr2IkBbIfyikpur8E5XSpdJM1onvx4ogzXxQfzPhXczsOEtIUaoHC89l
	 gBN2i5mpKr+bh4MHvF8Fi5Vuj4zwG7m1Uw1/1Sy1pE06KV2PUjkJor7MA0+fbbJWBQ3z0
	 8Y/mA/nl8TPmH2YWNGvuXvsKH9HA0QCdKv23piGa3OxExX67eKLHKmfcFb9eTHx8ezw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354562;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KhZ6mUNXdcozZQ5cv5MxvSF1NVIGYgXorWu96K2mkU4=;
	b=3/u9OxGSgWUYu8xkLLcVdMUK7lbo0Gvef44xzUZh3KIMo8qkUqkfDtCWdHPnGQIHhjTC
	 oV+vQuEN/9Df7TXVThNmLGp0tKDcyKByXPJ/ni0WpDLiGeTINQHMUO3RdPAzj/YhW8vzS
	 Qgx557572AXjSuk2AZz2hgkWla0vunwUB5CYabSvO+NbvXIm26A3ORETgjn3uPMd4Slxs
	 gMwbNweM5fDV0EnvR2ZgIK3LCyyJJzb6Z8ZmY0zugFebB3FYx9cU9JOu/55wDWDmOffhE
	 x4NUP25vjRBHSOpGi0Ki9y1vxpSSnAeu51R2El2Xsudg5MVB56RsQspTDQWFrbHT0eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrZlYMaV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A840606A320;
	Sun, 22 Nov 2026 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrZlYMaV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354561;
	b=qUgOQapa8/3YfzYPBpMIuXPLkYqSIDt1+51yMVputr7Nmvd7NjCm5KkEhWyBsRBlJo8Y
	 EGrtKnirmm9WSYZQUX/P/fp75iuV02I4gN3w7f8zbPLQ3DxWBaSeAQTZio6gv4NX57EeB
	 csWLLdOxUE540I3AHHEUgxOWymcJP+vPOyd1edTq8HGcevJ3nbf4EtwhL6FAHgBg7PNWz
	 aD84Wub1GWCFSceIFPgTwOlM/po1TKxNKQFlC/16MOwq8mUbbBhO97gpPvO/NOn/uTY74
	 OsQ06laFgpIvGZSIptSNLNq7huihszqvG4BEUiZKDoJniRuztZlxNA1SmQh6Bon27Tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354561;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KhZ6mUNXdcozZQ5cv5MxvSF1NVIGYgXorWu96K2mkU4=;
	b=ngiGKMFfVwitwGZCiWWD3AzfX3i1wn1JXKlThc2sJk1y1HfSfj1XPOMpelpZ4eLH0o3x
	 2yQrjfjKQA5dTAQ0TZY7JIFWAVu3s6Zua+sFn0y0kVjUyZkcIDmoUearhBAvDI5Q3D4P0
	 D7Zm6HzDsnUAuVMq8Gyawksac9LDwFVlaScCEyldOK9EGbbb722GFKlaTg83WwaHzkdHR
	 z1YV1UEX+dm9VphbFRvGohs9OjfcimhWenzIR6YJ2rAlai7WIavu/kMZZh3YpXcBGB2GP
	 oR1Ah44cp19j1s4TBMJsT69yK3x45xVVrVLhnGo/vGJzOjPHgqIAHAts1+YtEhMhJFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02C501F000EC;
	Sun, 22 Nov 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354561;
	bh=KhZ6mUNXdcozZQ5cv5MxvSF1NVIGYgXorWu96K2mkU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jrZlYMaVyIVChHkv4VgFwGfc1ouJ0lI2Hogxar8rjueL4xp4DpI7Iaw3Q2D4bxsX5
	 25HE2SeIAztazypc6yfAd2jyNRlj4TCbCef1ruA0XwcfSHItmGDMOASMmKHVhOiRex
	 wJgAGXJ25fwUPvFhpCbySlYGeYWOUvcAyfyPQpZCNN8uMi34xUV0Mppyn4gD9cyv9V
	 HVUHfLeaQM8gVLotXZUTZwUdsQnK5IfX4KjObGlkJs83UG5N+nHR/xQWcS1dTaCn5D
	 SQPj5dRqHEY09dzI00CBf0az3OaHufit+8ZOqTNozowHvVDsrmaQ0QO8MFFZCUOJkH
	 JNaIUxm5XEScQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 845F94C0AD;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:35:51 +0100
Subject: [PATCH 3/5] media: qcom: camss: csid: release parent device on
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
Message-Id: <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354550; l=3057;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=HTbUwrQN+kHScODumqx10WGhrvypX+o1LId4XIfvzAA=;
 b=nmf6BqeXRMJcez+klGQ16Gfctu/v6aLrm/tFPPjbr5x06Gde9TDEuNLOx2+HcJ4QKkKb0uhu1
 oECnPw4x4PdBvV4zKtKkZ3ErfYjBkum4Qd7uIvc6gBGuQJIIAHJHO7z
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



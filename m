Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795477442;
	b=OsMIF7ANXaKf/eTbF+bKs88voSO4tGPDxXu3pZuRhbCgAlIZ96aXwpkIkDwu5dz827iT
	 3lby5K1XsND+b8V723hzsJy8Knzm0SPYnBWDiJ+JXnfp1ucbYjip+vetFXjJyLoSwErcS
	 SmDZ4Oz3pgc/NVyPnM43p6tjkmOT8CyoLOoz0Qx198FX1ZKlYJbIlppG3zJphBTOP16RR
	 3qsPfNdgJ0c61WjbxLsoR3dpbx/2/nMDSV2yjK/kY6Mr+a1acTvaN8NRfgdPkzi0+SlgJ
	 OJXoiNlGATZqNdrAfuxci8nBGdSSoJN3HbsarDxEFC5KEWMmij8I9FtOTM5usnX7/tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477442;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mrqZlDoSndmvH8oohXzu1aZQOLzceRV3YDgL0zT9Q60=;
	b=dRdyMAnyRFulivBWqFTw821hBUuQYV8WmR6SfOVBDuNftp21mPktjPqkjLJ3+iqObPg4
	 EMq2fLDkpqe4Gho3nzvZDMptYr1ECjDtYYTThwCKH/8drVgwl2C7OCNkD+B+oNsTk2acC
	 S5YPaVgpeYtNHhoRH69jwdhK9TOtC2HFaEZMu128kFWfYbQZDh/qSMgeQ64XyBZ5Vma1v
	 PEB61A8s3EMUu1cYJqkQ5yNJN7FB36ku7la5sOZvAiM6aIh1i7QZh9sLMe96rekpAWeMx
	 0TfjbNiUjc3QDq0e9gE0zie+qXJlWtfMzdNaIFqagGm06fccCWpTrZWtO/q8wD5DXKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjS89uEp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B73606A321;
	Mon, 23 Nov 2026 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjS89uEp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795477441;
	b=EOe85CE/iv76IAsEolXf0mSRX8ksVP+erJNBrfCGSCKU+lbqKFlA0HPSMevA730LZCxf
	 rcoaa6AyGo8u6K4XteETt8PAnVQzHpM1xzRhg2Pk2OHKRC4t+/ZJPsYmvB7MbWFBqF4fk
	 pWwDgtsEYYoN7n836GhPzGnH6YaHueim/nVg1wRApZklsh8Z5r4CFqK8EAPOl8iDNzvhZ
	 U0SoPd6gPrnQKz1SSE8hn/Ur86NJTpY+tnQVjrNidZKfKOpeo6ENZ0gC6YS9jridOJvMl
	 ytZDaOu8LiExchmRNJ0pHxk5Me7RIhSsSYc3b+m7sTwupTMhgbylcofKluPt/qZDsag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795477441;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mrqZlDoSndmvH8oohXzu1aZQOLzceRV3YDgL0zT9Q60=;
	b=z9qjT6IVLuQGc0TDS3Tz0HtQXCEQi/Hw88RiU4WEfxCdcVLAVAoUBP0QDObIqzJUhN8A
	 AqLaMS8dohQEzz8Bo6YGaMWJjIvJzGzXK0TpTlWQkfQT1XELwYDx8AI9vlFAd5T9e/ZoX
	 lJrwbPXUqX5QFRBLc1B98M+55snGgOBdHxXIrS185rw2c8crmkiIOlIITEBzj7oi884Ji
	 wKitHhddvMJY484jXlFCw2D46v6W5ryaEPYOsqKrUqMUUCqwF/23d4iWDu4ILdTwzXXX2
	 Cn/GxHnEU9qFA4y65h1yrnfmQQLGmY+Zo9PJU28F/6CnPdVQQy+aC4aYEDK8tih7Eyg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B9B31F000CA;
	Mon, 23 Nov 2026 23:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477441;
	bh=mrqZlDoSndmvH8oohXzu1aZQOLzceRV3YDgL0zT9Q60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WjS89uEpozjK9CJaYZTCBPkXCKcmNB+TSkCbxoklNKwlzlw6lG51aTeeGr6DNj/PG
	 gYvilukVx4lU+OM/Wyk7jzMM8JhOGBtfhzTPlQHHXJOK1hG100RaD0x5tZITANVciv
	 fm+rpUrbjUO62PcpG1cOi8V5SdcHLPFj0crfHo+1+1So+pNPvxtabcAOBx06/3sELw
	 bmNLtZW1V6rB4vaqmPqvciezTyP38OWgKHpMYD6lrEiZZ89cL1QVos721UK/TjOVdS
	 OgDHE12G0JHhzHidjVqlb1BuEEatzXaYGXvYGR+L86vzJNYlkED4AE2Euj+isBMFDf
	 9IrmdXu7bWG+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D3C304C7E2;
	Mon, 23 Nov 2026 23:43:55 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:43:56 +0100
Subject: [PATCH v2 4/5] media: qcom: camss: vfe: destroy mutexes after
 unregistering entities
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
Message-Id: <20261124-camss-fixes-v2-4-231a5523cd59@gmail.com>
References: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
In-Reply-To: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795477434; l=1597;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=UM8AcPmLNuPVw+MKiC+h7fTqIkZrDa+p+xj0aLmSxTA=;
 b=J6l4XvMfpSqm0HfOgBsu3D75SmFKfMOolH3iLOnOwMY8ogzTX/yrdglmbkN88Ex+HPn0xxFK5
 Rsoqc6joTbpA2exy/cFvNjXoytsMKA8J2+mWVz5kxjPsWDKkCpzmMrs
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

msm_vfe_unregister_entities() destroys vfe->power_lock and
vfe->stream_lock before unregistering the VFE video devices and V4L2
subdevices. Active userspace handles or concurrent teardown callbacks
can still acquire these mutexes until the entities are unregistered.

Destroy power_lock and stream_lock after all VFE entities have been
unregistered and cleaned up.

Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ad09593..fe6b7ef 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2168,9 +2168,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 {
 	int i;
 
-	mutex_destroy(&vfe->power_lock);
-	mutex_destroy(&vfe->stream_lock);
-
 	for (i = 0; i < vfe->res->line_num; i++) {
 		struct v4l2_subdev *sd = &vfe->line[i].subdev;
 		struct camss_video *video_out = &vfe->line[i].video_out;
@@ -2179,6 +2176,9 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 		v4l2_device_unregister_subdev(sd);
 		media_entity_cleanup(&sd->entity);
 	}
+
+	mutex_destroy(&vfe->power_lock);
+	mutex_destroy(&vfe->stream_lock);
 }
 
 bool vfe_is_lite(struct vfe_device *vfe)

-- 
2.56.0



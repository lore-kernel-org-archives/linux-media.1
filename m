Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354564;
	b=5d0Or2zDd26CqFDfB7Qbc9M+qLnVkT83b4ojkg48YmwJYYXGu0c0oST1LC/Rl/BYHXza
	 Ao1DxQ9c15MvwPnQsNGrNg6Vmll586FNk1s7rBvFb39fAV4k5Hm82Iu6bHxbz9we6j8kU
	 lxoT7zAe5Qz/Oh3HJKXxLYsDgNtmiE7L+jurHcJZx5tAMbDiXm3cTZaSPWSOCh03ShxPx
	 h7Oz/q0cfYfVbVuXEA2Cb+5MSA0gfItJxZMjZKhJNi9DIlaflzJnv98pzpfrHWhMSXqXT
	 4VtkzrLzEjDkFaHWo0VI+lW/LZ4K3iDzRb267QkPhth8tlzPJ7UpqtLWPIcNpM1Qqtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354564;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c2QsuCWDPbRYUWD6G/mIRpsT/4H4rCgNsdnchtMOxKc=;
	b=e8UFZo7m0JV+rHs8ykpgrUOK3ht40LIXF4T0pzER+BRFI/DWXYM9VKNGVjlRkglonqNQ
	 wgDSwZcdXJhJJjK/IzAMnmDXFHCTQNe2w+Qju5sHBsee7/dNBwUl5Dv7p3fHpdkdxmkhG
	 S+Dig/DYFRhkRFYkTNmt0MX5eowEqRUx5hNhXJX6yNmgzShICh8ItZQZYlOvyqebtx0P/
	 0eCV1EZ6hg5ikOPGwMXyWKGjnu7ppkgBsVHQixUWDFAxPDG7hEBuhODasqPe4u+YRc6P/
	 OLz8lWTCd2JyhPlk3aG6vt+uWwbkMDNtpJbpil/MqwdZ2/0bYNrqNsI+XoHf8pJSZbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcFZB66M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81355606A339;
	Sun, 22 Nov 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcFZB66M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354564;
	b=JS9YdSHLt0BQXVpZv7UJZVcjAa/Ijdsc8RMNr7+RLaVYzljDXJs5YoPgMgQAF4R9ycCu
	 ogyhbuRC92Br/Z87VKTCntKB2L5ueLfHhsZpq4goI+1irSyBTaWSTJH1uUOtgIMpEuF6X
	 qSBBb92bt/KtMFicTnZVLrUJB+YXDaUT/awafUHe0RVnArPpTfnSxje0iCeulNmvCAfDU
	 LP23nblxGebQdlUgYBFB+p7sovKIGGO3sY8rejWxIwUK+drxS2lL+ixxaCrGm+Ffz3JWD
	 q5wM+nekLFZGawSf1nPsAVDqmBAAlyBJ42EHTA2Mlm9S6XvzadGkAWz0kVursn4xG0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354564;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c2QsuCWDPbRYUWD6G/mIRpsT/4H4rCgNsdnchtMOxKc=;
	b=jh/+TUGl5OQqQxPCRoIymMfu18GqfK31fH5kw/r8Xe3p63FkHkzqp2fTcR2MYlD4SVA/
	 FnHQEVl72uqaYSZfg0uzPYNn0aaRDemDi8/O0vDgS1y+H94TdZoT/tqPfbxU9R4hkXtJV
	 NcVmzXv2S51eof7+rHlTaO2tBO1jeoKgOfw2zZ8RowUBqFCdOusmDKVmP8FSETKWyktKC
	 tqaICSNFOTdWHVuoN0zwJCes3f85A37Vjoyflo+MXgNt6H66U+PmNu3u3weiqa14fO2uT
	 P0C2QeO9xan570kV0kgy4nYsEWaWdzx+OExU6hSs5He8xguldLlxqq4jDo09Sgetm+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B7B41F000EE;
	Sun, 22 Nov 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354564;
	bh=c2QsuCWDPbRYUWD6G/mIRpsT/4H4rCgNsdnchtMOxKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NcFZB66Mow62BtzDz37VDh92KIOAjiRK4sa2FMarg0G6/qe76b2YCggFBRVQG5AVM
	 enToKFayeabzLZ2al7KLaCCDNEzyBtpl91sxIgWiuFIcoO603YFHXQtVDEEnVl3DtZ
	 IDimh5G9OQrY0o1BhswvMfdfneDv2EDDdj0fCllyc/R4R7qFpp3fcHPL81QHh5GiKX
	 fY/4O4AGDAFAL8ExaC++ZAFx1Q6VfOSsDVnR/y5R6tw8rozdE4HtCxMPYZYYR52fFV
	 n0V/rBYVRJQBxCfhFQJjxI9DsavJNdV93EDy7Vyrlkp6RV0hjFxT4C+LCN7Rjkyepw
	 S+zhmoaGJZM3Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9CBAB4C0B1;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:35:52 +0100
Subject: [PATCH 4/5] media: qcom: camss: vfe: destroy mutexes after
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
Message-Id: <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354550; l=1478;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=fxXjZCpKylb9Zdw8zET2pjCmttHE0rto+mTxN2BDIWI=;
 b=YHXFpQxs2/W8ARGIle65Lw9LvWpUEE055taSUQaSxu5nCxWhzkom10uFC7X6miUT9wIX7R+kV
 Zf4rrwzAcsZB792k2A/iw44uW4YIyT2Tv9im58IT9o51kpxmaLPg0BD
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



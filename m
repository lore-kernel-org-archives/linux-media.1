Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800A4BA1F6
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473021; cv=none; b=BTv9tfliLa15CqIAys2RfLMQgNIJtJAQjX1+sZrMUfXsOyYQr8uLpY6y65z/lN+MntHwS8i7zX4lGdEPjuKs31/EGaQIsuxn6910yFMjWTOxk/AyuznaK7QGGReNiNEIlcPS7xc6LVrtSYfOv34CNA69OeFdnJE5wgEQdWmR65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473021; c=relaxed/simple;
	bh=HrpS0+5vBPnHQrYihC1+KHpGhL5ZrFqgwBQSMxw0ThM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juj/oSh1KSCNRee2gDB63FGasm3Qrn3FLIBIJmM/FfpiqKKxGp6XamZCtDE7ncrvQRzBDzSRUV3Euv/8ZjlKGlQDM8oNlpHiEfYUsPmsu2hs48b8eaISUSDAWc9LEiDFs2LG9IKrOfsuy8MU6OC/H4V2E7RytCpU7/+Al1oRmWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMFMXB5L; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMFMXB5L"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so39215345ad.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473019; x=1790077819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=;
        b=eMFMXB5L+DTy2a3IjmIHvY9ZjftWpnyF0Q5dC0hmrUN2T6KEbjP6fVGOHbzh9TXxC3
         jse2cRB/Y03QYBOqmllHPGF7FuxGuVui6Qr2i5gFw1xfv3bbsTDiQuyRDd8XSakGLMqP
         0HwVAPGtn5xqpAe6uiAFxIQQpkBdA91fkh6kalWvb/F5Ua5yAiBW8Dj9KhxNKy6jYcv+
         HWXx6JHVslkJMAqvzHBidoHzyVXTjokAkC/XqLzlpqFUiIv/owi1CvB2VQLKNHiH60yl
         N2O2eekbH9uG2AJ5+R7ayO39s9JJ8a4OD0sZSf/ntr47e25HVrg0v1lk4B+dODVVLane
         33DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473019; x=1790077819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=;
        b=IG8T3a00ALdjQf1dRtUOuxrV8z1v0PoICEO9Rc0UeetatirxA0dKGKMAw6yF5/DlBB
         4FxSudqVJlcQM+H5a6t1qjjpfszFFMDwxY9s/v+fo8pYko0/HNkitBBhW2MUHClRZmTa
         Ij1fsMsFPiPMksiDyfyvRNrG5aPGbeipaN0rvOxsK0c/OzulQmY9XOU4Ir8UMRyqLCPV
         Z7yiTxcY2AEjh0rV7fmkUAFygeVSoZT4MbcuLr5oHRZjygJz7jBmWKHaeMoyw4obE6YW
         IAuSmmLa8ykVb6sLEwxkfyK++UibTeUTgCiFPQw5DLsKBxhUO9Fl0FDhQv0ZOKdW+uj4
         R0xg==
X-Forwarded-Encrypted: i=1; AKwUvBzBqYH0enYTIb9P3KXHRwLc3+Rj7w33wxZkoHhRLYCLqjUT/+hHwNZqyS8AlvFsB96B1UrY9H3UkgWwYA==@vger.kernel.org
X-Gm-Message-State: AFuF++kU2GbODfYKErd4ZHc2dsPYmg+ltJDADHx42HDsyUc5zLnjJvav
	zpBp9gHMAJ39oo9b0lWpEujG/wFeWbLmQXW5Amv6K+mpZTz5/qJHhJyP
X-Gm-Gg: AYBFou1151rcbYnqclZ/IiYc3CtpvFdjBL2fcutOf3YTIS0RP+bFXuHflJRFx2oLhh1
	7r2uav3F01/SJLOzwvX2ZIVm1FPiXYcvxlcDw6Qff0X37JH22VYDNR6kqNAhwyomvbbAZ3y3wlT
	e1Yyns4/6uYahs0IEPHUqTN8arQSxooN4+6HOY9ehN7Z1tuN3bd9rZPwTBswmQRvOgvFl8a4vDq
	opbkHJw+BdrwjrGqOfzW2HoL7U2uyklr+nzhu0uy8G+r0G+ruOlJ4APr2b4YHnpILKidNyWvxd7
	IezyZm5Fl7KGqRJoD+kmseBp4vWiDUFQ+luNhB/Xm3NrSnDOCeMPO4ydx3NUd+RxXcI1yZqeBsX
	10hVggEXjZrL7g35dmL2bibU10g6gqO3Brglm245tj9g/Wvu5jG/4GfsJQhtJnD6rP19Psto3W0
	pJAf2RlzK+ksrpxghuQniGlMba2U2y6f4ZxcxV8Q6ra1t7U9rcpaK2iQ==
X-Received: by 2002:a17:90b:1642:b0:39e:b7:cbef with SMTP id 98e67ed59e1d1-39e00b7d25bmr6619070a91.25.1789473019195;
        Tue, 15 Sep 2026 04:50:19 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm4943498a91.4.2026.09.15.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:50:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: platform: mtk-mdp3: fix resource cleanup on remove
Date: Tue, 15 Sep 2026 19:50:06 +0800
Message-ID: <20260915115006.2409591-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mdp_probe() has two successful initialization paths, but mdp_remove()
does not correctly tear down either of them.

For the main MDP instance, mdp_m2m_device_register() registers an M2M
video device whose release callback performs the final resource
cleanup. The remove path only unregisters the V4L2 device and leaves
the M2M video device registered, preventing the normal video device
teardown path from releasing the resources associated with the MDP
device.

For secondary MDP instances, probe returns successfully after allocating
an mdp_dev and storing it as driver data without registering an M2M
video device. The remove path does not free this allocation, leaking it
on driver unbind.

If an M2M video device was registered, unregister the V4L2 device first
and then unregister the M2M device so that its release callback can
perform the final cleanup. Otherwise, free the mdp_dev directly.

This issue was found by manual code inspection.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Fixes: 4294b9d6c8c4 ("media: platform: mtk-mdp3: avoid multiple driver registrations")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f412aadb5996..bf5cc20af715 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -374,7 +374,12 @@ static void mdp_remove(struct platform_device *pdev)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
 
-	v4l2_device_unregister(&mdp->v4l2_dev);
+	if (mdp->m2m_vdev) {
+		v4l2_device_unregister(&mdp->v4l2_dev);
+		mdp_m2m_device_unregister(mdp);
+	} else {
+		kfree(mdp);
+	}
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 }
-- 
2.43.0


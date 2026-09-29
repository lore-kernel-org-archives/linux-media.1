Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19783C3F4E
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674129; cv=none; b=Oi09iilFDDmGg1G5xmtKmZdt0q09/6sY592+MjiJBPZmuCOHoUAf4U25Eex4YJs74Xd8Nv9QjWNwEtZdIk9NX20rtEiBav5bnZ6BJ06FuOL/TY3D11xiAlJKRZhkTJcwdycyaZjjE1ysE0OKZlOiu6ZS0SgfrZwW8durvKCmX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674129; c=relaxed/simple;
	bh=jIQzI9+A4o2AckNvjSyl/4N91rZSr5JY5roZQlJ8cd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwU22FOs4QYumm5Jzimw6H3/PAt/J98OSrjadAWRGtkABWqFEWxAkYijHFw8vOLP/DsqxT+x0/AvQpyiet7IlDRdJnEZzEN6aQyn+9Ehf/MYBgNZwEhGYfb+En9oK1z/5kbE/mkF2ospoKbw88QGV29HCDdwUkkD5TBfZllczdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssBYhL8J; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssBYhL8J"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ecca9f3fso3049170e87.2
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674124; x=1791278924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNu/CsyE7pSagieHFaxR4LRsyGjSzrWj83DFH9sX2nc=;
        b=ssBYhL8JJQhJ0Ke1RTkyZwzRdkWNkSETZWw9iznQh7B1l2cwwDomtuJvYlxHj/Q0+W
         /dSRo8oDTkbdOTSGjbA0W4YhFJY0gxSCKR+/CP/gmZc+/kTdqC/f4eYLoC7gIof/6dH3
         yLRmbm2790qgXK+jvFFihYuPEQLXsKnvJmWgEsyua4oT/JOAYh3uq7QsXMy1PhPYfDwM
         HSt0Gkqogh1/64n1OO12GNwPQJbOOv9VybuyL5E2vZnVQ/l4X5AtnTu2eS/+7GhEwTWv
         vVtXT75pwqQlxLuxCEapj+Ghodvk76cNd/XuXJ4Ibi1qsDQeeqjSuNITYEbZqqvsH79k
         cyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674124; x=1791278924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNu/CsyE7pSagieHFaxR4LRsyGjSzrWj83DFH9sX2nc=;
        b=O1ZaOygtO+yI1akE+0V0VPLEE0TAMoCxO6uiEFpmV/SHSu27loMArsss1P78+ueLxZ
         mw4B+g7AvUserhtQWDmhJoiW3VblHBmRyukal9hsTdBug8KRBNPvyPVwM/XxU83c/XAB
         4xo4MbFddccV1gOLghFFLrOUEFzZyx+m1koVCFc7DRWgd7VuPSkWQeMPhTgPNn4qk9wg
         D/qm2Nfu7Fg+uS3U2pFzP61cL74Q0MLFM7I94NA0GzBYYrLVpYQsB/G8L1RL9Z3NwTdu
         13As1G4t7/Qf+fjE3NP5UKqM+g6jHqV/5WRZ/BVDFgT2HALjCjKZy01m4dYHGCxLLwqL
         xk9w==
X-Forwarded-Encrypted: i=1; AKwUvBzAcr8T5WVG+ZFDXZcPtyxTmH7rgbrcb5LAlJe4LLSMFOcBEzWB7yOuro6WTQrHKbdcuaq+nroePAKj4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKw7ROjUVoNMgOhC/JSR/n3l6NQrcbdVUzXkJsT3loNliNkAAJp
	b14f/VaWnJQFYAZrvnMMniutYxtkbBXo0cPuTnahiNT0a399x71x/0Mj
X-Gm-Gg: AYBFou39IhDgccWBqxZDjsQUfjqeFzyY1dxADArHRdTKhmZv9VEYFOzZwBjmnuSQZzI
	RQyU9aqRDNBQRsDVu0RLG9vOkOfGDZdp3cnqzr8up7BX+hkt8YM0HjYx1Baumy5zaTGkqG6+Aqk
	EcY0K7W2aNLwuc+FLNNesIHTMPq15vva8Tm5Ra2Iapi459i8Dww20Bbd2EQsKZmqkKRVT+EDG1Z
	wPvl3/fUI9SA7/bGGocBdnCUeVjfBKkXHP7HIpsAnARnwk2ljBdj0EmKUWuqKQef33MlcHcWJY0
	ik0PuVc3eUlUOmDn/uC2fHLvd7JKM3pZZ8DRQdh/NfXS7WPnzOUgkWNA1wCMaRIhhYa4O6FQsNw
	P9JXaHCPVDRxy4TzAaIkzO99Kb5nq4jEm+hdPEWf0ibRm5wMvUFablO0MTxZsUzqtxKVVGj6tmh
	ieW+Q8DAWs/0Yx7l4xU0+oY5LGf42/loRhva7Vu8+brM0OOrRed/bTT9A5owRnttnqkIdMgSFr1
	1M4qZSd2E0=
X-Received: by 2002:a05:6512:12c6:b0:5b8:bc5e:d106 with SMTP id 2adb3069b0e04-5b8df0a3c30mr5516039e87.48.1790674123980;
        Tue, 29 Sep 2026 02:28:43 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:43 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 3/4] media: i2c: vd55g1: Return the endpoint parser's error code
Date: Tue, 29 Sep 2026 12:27:00 +0300
Message-ID: <20260929092700.1776966-5-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the endpoint to v4l2_fwnode_endpoint_alloc_parse() without checking
it first and return the parser's error code instead of -EINVAL. The
parser returns -EPROBE_DEFER for a missing endpoint, which is what a
sensor on an ACPI system needs: there the endpoint is a software node
that the IPU bridge attaches when the IPU driver probes, possibly after
this driver. On OF systems a missing endpoint now defers the probe as
well instead of failing it, as in other sensor drivers that leave this
check to the parser.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 22b1497e8..8043eaa50 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1801,7 +1801,7 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
 	if (ret)
-		return -EINVAL;
+		return ret;
 
 	/* Check lanes number */
 	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
@@ -1905,11 +1905,6 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
 
 	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
 						   0, 0, 0);
-	if (!endpoint) {
-		dev_err(sensor->dev, "Endpoint node not found\n");
-		return -EINVAL;
-	}
-
 	ret = vd55g1_check_csi_conf(sensor, endpoint);
 	fwnode_handle_put(endpoint);
 	if (ret)
-- 
2.55.0


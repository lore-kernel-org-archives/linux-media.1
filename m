Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE3342532
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154137; cv=none; b=r/Zc9bKb8Mnq76jHP3BFNEpLZhDdFRUzEdgQaFbzl4njPs597BtWBl1SmVZlVetJwFEwCxNEdUjyZcwlIYyEWQ7HKLIN02xKR5agRsphsbvgGTeGTd7HPtRRt7V1EVoDjXwUumWz4MM+gqcaM2xYXibpaFsE68gBLwljVSjBd6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154137; c=relaxed/simple;
	bh=kTxcJHE6iVe6RfB49bXDbrA6ICjAjhcYetRvA3pBtHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSRY0tZDMZK2RdtwOrD9cGh8QxBv2feMIwGEO378Zt76uszs0uQR1d1E6yfIRywORe/zzPJOwd9gnkexEVWMjXDJTnEcDCIvN4y4m+TT2bHCt36RNrI425vzozUFutapdhfAOTc27A+/J8d5YTWsXdUDbrITo5lhFYU8H7qPJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGQPBxus; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGQPBxus"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37c8e7c8185so2774421a91.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154136; x=1782758936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctC2FHVouwwXy6nRKJZij8fpoFOJxlyQsKFiZ9amI48=;
        b=DGQPBxus85Av1lGB2K3X4VXwrRDsrfSPIWBtaXq6FN4aIRxrpac0ZTHoE6QRcYFL0K
         YuGpf6+JxXuJWcs6Ir19CQvLoLWadnNrydwBVuCPp67Oq7an3XTn/IqD9IB0Yx4mseWE
         YRG5drbnAsRkKK9Y2y0XnsZVJVguXbeOqTVemiYebOyNSZrEgDonTwdJTZn10OifG3us
         5ELMFEcwH4tcDAgie//W9hwiH0u+3Y+TF779vRlwnfCKIg8BDfeZp0TEVS8OUVquaUyM
         QsX+KZDwZH/JkkRk+QsMR0vSaRhoclsKXiifmemD32mSdJQkUfrYbw1J3Cgg20/gM5GX
         eqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154136; x=1782758936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ctC2FHVouwwXy6nRKJZij8fpoFOJxlyQsKFiZ9amI48=;
        b=N0cg1EHjWmDqno9N7NswdCDLzUzU7gwMNctlb4hednB++/Cz+W7f201AFoRUzJPtGl
         60ARBKXCLXOqa3EIBF5Enn2mcTFktpA1gIMMPTCpqt+LUddp3aglwLwvaxNuQ7ELIE0w
         q2fSW+ZS8nkmscM9to8gQ1/PMfdu2NMlCTiBDJarFqqHJmNZQTE5eihDRdcDlby/BmE5
         ehFbaqOcQP0wP7PVUMGKpxHFeHq1p9sDt80K4Hvv0c0G3TvQqMCFD7GO1C+5q1brtWup
         GhdEZHK1hfUOaU9vzy1fFXEaRbPhbS6S+j1okgXP2nz1PWSm5qcuFSZ8yayTkuiUz0je
         f4BA==
X-Forwarded-Encrypted: i=1; AHgh+RoVnfbuIkNSCY9mQWSj0FfH5hZoVRuactvrtEPn1KTsgMfQ4/BckDKUZA5e5YUllhpXPsQOYVP9KRtO2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGclE3Q+yBfC938ii+mOGQhrbeJKzNRoMeqXCOtj9CUhFGHyY
	J9BZ1/A73aYH5A5RYo4ynYXIozq+A6CDcg0BJPhEL2oxjofcwtfFU7Go
X-Gm-Gg: AfdE7cmcoXijLk/fD940iEV8HP5ph2qMONmTB8Hi2IDChcWf/JKfWdmcSToEfN0g/uZ
	DG9PrtBmNBUpk6wMFg8A7rsQiAjcyE6c7RQCVhB1/V4/x6gOg69S30Jef78udQew4QsChLrQiWI
	7MJt2GFzNb99Y4BFQ2RUK8qdtH1sLZxh29AiCpQ2FXKOZHbWPolQHrIs7RHzZEhjTtJMhRyvONI
	2bm4P6FtLvq3VqdcW4DZxx1dK7B+omKDlNCzDyZdYYSHP2xxgmABAsPZep+Thn0X0/ZmeaMuHRm
	YXC+FPKit8W7DR1EAJJ1CmnqnE1z+yBl1BEZJEpjwS7ToLEnllbMCGmli0pbzw33nKjcGZCEauV
	qinJUlLDypRRP8wri1Q11hnQ9eINfuvyvjtkBRjszIoPzhcgAVX7ZYvDKbnyhyDvhXhdpKoCGg1
	s/4jxuEYPf8WqdhOgqSR0WVtOlukel2F0QsKyb4SOkrQ==
X-Received: by 2002:a17:90b:4fc7:b0:36c:e254:4db with SMTP id 98e67ed59e1d1-37d15de2dd5mr14416797a91.6.1782154135814;
        Mon, 22 Jun 2026 11:48:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.48.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:48:55 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	birenpandya@gmail.com
Subject: [PATCH v2 1/5] media: i2c: cx25840-core: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:42 +0530
Message-ID: <20260622184840.66226-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622184840.66226-7-birenpandya@gmail.com>
References: <20260622184840.66226-7-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 69d5cc648c0f..a3d7473854a3 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3962,6 +3962,7 @@ static int cx25840_probe(struct i2c_client *client)
 		int err = state->hdl.error;
 
 		v4l2_ctrl_handler_free(&state->hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	if (!is_cx2583x(state))
@@ -3986,6 +3987,7 @@ static void cx25840_remove(struct i2c_client *client)
 	cx25840_ir_remove(sd);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-- 
2.50.1 (Apple Git-155)


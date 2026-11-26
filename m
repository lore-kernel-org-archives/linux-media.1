Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728621;
	b=Boc+mXKOm67cJML+tTvdK9rEJ9u6snxB4WAuPWhGk2c5vjVHCDDxx2RmA3urrgFgdToI
	 6lwTBIhXFzPtmrJ0QBWd0B/TSODbpKtq7yHrmO5B2DUrfrWWehUW6Ik08D1WoLR1Vt6vr
	 No+tXEME/Hf6u1ObhA+ZAe6gRP1WzpiIEY4hPYWv4IINvS5hi0b0BNz+CaeOGjnN3YWcA
	 jzvHjvryvqn49xjXfJsskupQp0O58EcKf8GWN5D/h7BV9tQxIaymxDkFGijoXzpQkZs/J
	 xpalxMkIMGi9UuAbQM8StP3N+0AMVE54j+B56T/8PiJtCSpoHnu0Y+Sjbd7SvB3zWow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
	b=0lP2LGNmBg12xBc+YWM3CYo8qtfqD1TxehKMD2m81IaAys4AoO8V2428ptoCNDuC33I4
	 t8ahQnygCtyT9vqz4J2AsUIMmXbyHR0vQ7GelG6DrwRmFiDIbOkIlkzsMe6RCVKuG51yi
	 fNLfbFygHq0VGYc2YlNs+xPvP/+DUhAL/ViqvY6qCfG5kBSImsCk/Jh5h9AsLpd3kRiNg
	 P4Wnj3Zz2+dgHPvbb/QsMP/VitruzVPp05/VHPH9aVEXFsJyQ8FYhMatptGqhYiZW8uhQ
	 2tBek+k5fBDxyd3i3OfypCUNu2hvACHKgOoHHD+tA4ubdjb4nTfEbG89whKhuh7M5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RypsSdu3;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA6606A33B
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57EA6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RypsSdu3
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so8167379eec.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728619; x=1796333419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
        b=RypsSdu3z5zQL4cI2yjyDizrcUfZmL4pa9V4UuoaJp+Ie6ySlULN7csUSlLKtcy/nL
         Ko3zGxo8SzUzV0vMxpdWjvLvNZVd5T/fjrt1cz+9b0xF0rKTovuNqsaJKGrRYSjqUKHd
         pPjdKfxiZ/3fYg97gXUkFNvhTVK00IBPjM9MMkPHUXAPC6xnyFz5hre+fJx23sqVrso1
         a6NS5yTZ7L2DqkWtOIqHcXPH5vvsavt/amIHYe8LPgqZ0png+J8JvFDXV69mZ58AirSw
         MJHXQ7DnPSSm7ZMpr3HFbaB79PQhGD4yqRza/xQLx+EX//1NfCkknrXkzIoBjPfaCNsJ
         3ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728619; x=1796333419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
        b=ed3gejQAL/j7bhbeQhpchEwdwrk5snVLwyfuiYyGZiuBb4XNlxBplzcOHhbiUZrclI
         V1eoDNc4RSPgIAGng3KI3cc/SXS/4zqqBpOmIO4vjoil8nI++0qdMhef0HCN+dHZi4vU
         4Wi4X1nKY2InE0UO+UslkQ376XsHUo7IE4SJvbdSRXtXt9g0gndj6DKSfjEvjEwvnl0B
         owuYcwbcKs0E+Naa8/D/Ja0eIQaiBLdEHzSYex0WfevXeJD+/cbF/KANEpXva5rmJopT
         qxzK+225U+zkqEeycVQVMrdq/uuHv74YJMOrb0z4/QuqdTtZavNFK/uwEc+sXoMUOe0T
         JHFA==
X-Forwarded-Encrypted: i=1; AL+hErFQ1J7rtF5l1ZVikbGifHryfQbNtyFEgqSdwG3QO21wT+BY8qlMIs2QsotTXxLQ7+BdJy50IOzOmRowPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+y1Z6WxJz/wMGX15Ho3k22xdwIgxz+7U7YpZTSXUQUva+hCEpk
	XKrgfBNNy3fbXmsLu8UoLlL169w5M+beJBfdKal1wg+X40V7RpngLRUo
X-Gm-Gg: AZFdTZfQmVPJ13Ok7BKC08YPhGugNlD2ONE5MWAoEv41FW00Oku69Bq8UmyjeqKNXES
	6C0IlyHRY0Y3KlFeBzSO+B+s7gCH8LWZJG9FY1Sb6aKmJaBx6Gqp87feHX55EJMmFuUKg6wv1qr
	xNRcfSsU018HDtZqTrjtzTpsUaZ7bYRCMb/qWbDBe07CMCea67narAW95VHQlQJA4VrLaS2SxNb
	iuHDtNzov8hH8rN+DRNhZQpkDnHjWXZ/4KhiMM46zsGRoMty/9xU9kO2Y+HIIPy5wZ4la10+DP6
	XsdGI3rcj2nZVwtljr68+iG/SYfgXeJD9LpIQnulD9l1i29gg5W0BFBSqT7CwUcGWMo3T94KLgS
	khSm8B6D0sBjOpfv6oJRZ9d1gfJj+1hhrH/TbmsZt3T0YiumaN3k6hrVykFJLarbHYpnNo0hIKc
	PGLSPts70CQE6nJieY4FbHRlV3eyrztIwe72oXe9VgkA68iQHbuyzqsGCwq0Yl8fJzI0UFKdZcx
	iEJhf0fQkRYPCzBGn/uiUv+XZKnYOYiQGzwXNin2ZMxr8MOLSJu1h+GKBXVITPKlWuWm5vpGMsL
	FSq+1huqJdQPgoZxOjX2/yUQC0OZKT93+M6maPo5Mn8rJ69/h34J5U7fWimRfGwDvp3doTlfGJf
	ugE2/a0u1/erBYI81ZwJ7WInE0nb+u6PvZ13A3URe
X-Received: by 2002:a05:7300:c00f:10b0:381:1eb7:938e with SMTP id 5a478bee46e88-3856c9a61c1mr27000372eec.4.1795728619425;
        Thu, 26 Nov 2026 13:30:19 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 2/3] media: iris: check the packet size after reading from shared memory
Date: Thu, 26 Nov 2026 21:29:03 +0000
Message-ID: <20261126212904.27207-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126212904.27207-1-dennylin0707@gmail.com>
References: <20261126212904.27207-1-dennylin0707@gmail.com>
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

iris_hfi_queue_read() takes the size of a packet from the first word of
the packet in the shared queue and then copies that many bytes, including
that word, out of the queue. The firmware can change the word in between,
so the size field of the copy can be larger than what was copied. The
gen1 response handlers use that field as the length of the packet, for
example to walk the buffer requirements in
iris_hfi_gen1_session_property_info().

venus got the same check in commit 49befc830daa ("media: venus: Add a
check for packet size after reading from shared memory"). Compare the
size field of the copy with the size that was used for the copy and fail
the read if they differ.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 12a7fd0982c5..55711f332a50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 			       qinfo->kernel_vaddr, residue);
 			new_read_idx = residue;
 		}
+		if (*(u32 *)packet != packet_size)
+			return -EINVAL;
 	} else {
 		new_read_idx = write_idx;
 		ret = -EBADMSG;
-- 
2.43.0


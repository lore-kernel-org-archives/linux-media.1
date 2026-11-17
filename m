Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948595;
	b=QRWGMFTwicvZLqqxVTmpbLRfBmsa5DhPC9bDPsYGPpbfIipwXsTwPxJoZ+eXVEnkNA9u
	 deyJgc1feeQGSu2mZ3unX7MG8mGxYSiVSlo03j40/x30rA9YNvIPbCpe3oglDDH83Ip32
	 g8/IW5Njvdx3rUMGb6yZpzqzi7/t7zS785ZaLNBRotrL+zjaBD1L8tk0XRQjzbrDYM4AX
	 o5GvXXQTw6xv9vaJ5a6QwhXTyI7WVwNBYnUixUA/lU19ReVu8ShhCtIoJIHHSPHhSFUzl
	 n7ERHb1jAjAEu8xs4qw+SR1Pj7CoW8Hy4DgtvXS94XxRKRXAL2JUDl03Rbd8LqLtrDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
	b=UwNw4Qjpn/oqI4MoKk3p6ssSGwGL/oT1dmMBtuIJQzJ6le3JaZy7qpOrx3jMdKxtjZs+
	 FdtR1CFPzhm8xvrsAouRgdprZOEoar1lUo/W4/+gXPb8L7cqyvzONyWHnRIq39Cj/jG29
	 kzEc321ym/gGQtTqeq7FTTPcD+6afUQpPlPhjnBT4zjIu6v8mPLh4RrEiPq3xAMvoN9wP
	 knbTotHLicCANMqxnAAO5nZwoLh/PKaUPlxMpjgXdLqo18cjNqLzO6DUNbQvnRKbifVxk
	 qKhcr9xVILCqCRgkb5q9HbhJbFU3u9W0Z9/SIvMNoR14WHF26HyItD7P5pV9DOti7iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6w9kSFA;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3F606A33F
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 20:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D3F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6w9kSFA
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso288076eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 12:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948594; x=1795553394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
        b=p6w9kSFAa3KeB1tx66Z35R6AkVkJ5TAt2zalrQE5hGVByehQEiaD7lmGJqJKqMpIEW
         xdDcURvY4k9dM4CyO4Hx77BTY73icie5zXztp1wJB0HhbGZi8Ey1PcGTh3vsEtr1FF0M
         dt9qDU5WmCGpmFvsvPXhzHpP2c7CKTmwSm82gDwJSvIOHMKFoCRY2/IKpbekyvuTkhGo
         gnqKH5jTvGJ0CPnzyk5CG8yfo8kzmlsqueHeCVsvZhRMSWD7ZSqueo7TLynvch4Iywa6
         6dyBMy2cUJDuMmzYbbk+RoamJSCmAJldvwY7CPHldR2H5pqbZqxNEMLBE+OXFkq8yuwn
         4FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948594; x=1795553394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
        b=nlAFD5jiWTwTyulDgqybMANJUP5J9fHGyDJJOe8kQFUMmMbmPedIcahbkAC4WwVFgZ
         c78WPFyp6hVQfhulkew4lesjiEXTMo801YLv9CtT+Ft2a1BhfxGI83raGyHQcxpiHpu8
         3LTDgDoTzBl4z4PJIAN8fZGn4fv2jId27fsXg/pDJvHkZbwuBP8204qKBpywtkWrrPlN
         ZT2myzNFSXFJlnN95y5sWdv4jW7qlTJ1+BZiYg3sTpqgC5bnuXgf3hm7te0gMsoaL8HI
         Bz4w4/jTBsChH9li15gDS7uJqkX0oZgHzPzn5/okHnJYupi5K1Y2Wjvbd9z0IuPzSE/a
         hwMQ==
X-Forwarded-Encrypted: i=1; AL+hErEMNIpZoFH77r25zYG9RO3qomZUQlOucrKOgKTD6MMdrex7MrNtH+w+SEpezwBi78inzmyfKEXkoRulww==@vger.kernel.org
X-Gm-Message-State: APuU4Z/sU/7hFnQAOd7lfRmxhDhVs7Yi0HfpZqQ4i7kndK36PCaTyjfQ
	EJ/bnH3XjNr9H+llo4HBmXWwy3etGvKDMnjDOtvtyqEmCTfHGWOjlzeuFrlXBhfBOaFvTg==
X-Gm-Gg: AYBFou0HlhRgz/v9jm8elhyd2Ni7Ncxink1lBNlBi6e1eO81D7jI80/nnnHyntkREGU
	qx65MJnhYnK3YFMZwYVwXXPKRaO03+b8yLUkHg/8ZyVJGyRi8cuvvoLeF0vQ2d71cN66SycyWkH
	yoY8ndwqrag7mTBxA+cU0HawvQyVJPQQCYJ2o9pFYiP/Z7AllqQLSpCgXAZEvOvuwaZOofnJwil
	dO1qCZ/YYrFLPvL0PBRaOsqFF5393q5P+W/fa/6VPgCtLlyb6uR92BoB/ExKvXbjxkKXKuHOBQj
	bZsqff4aNC6TV/ojTREU/3sUM568BvKqV/PCCDd2ijYvEn7x3VySyeu6pfg1ty+aJfdcLqNBnEP
	6pyb+BccuYrdyYvn4sCwll6VX3l28B9UAVUdYGNZ4qmXdQbRlvxg+Yk30DG6NjksOKMaU7h3z65
	lpyxHpJErpwZtulZK4d6FV9H8TNw0/p5JBSYe+u7viIR/G4skTOJ4YgV6dJpWaqZMFKnZpZf74x
	RTRiKTqUlMgOA+a+4vj4tGiDUo8HpUR29a1mmRIdZKry8QwUNnnNLBH35r9Z3MMGQ3hdfpNryVv
	Sv5EbDJVN0XubKT7ojSagcbER9TF1UcVs1hERosk0M4dnCldZcrfZVusWUxlDKGjkESfsv1Ekds
	IQyKKRImHvdZdhjBTkYyXZ/4+uN0ASKzdmwCwIw==
X-Received: by 2002:a05:701b:4291:10b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1b543d0cefcmr702286c88.26.1794948593763;
        Tue, 17 Nov 2026 12:49:53 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:53 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 1/2] media: iris: check the packet size after reading from shared memory
Date: Tue, 17 Nov 2026 20:49:44 +0000
Message-ID: <20261117204946.21359-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117204946.21359-1-dennylin0707@gmail.com>
References: <20261117204946.21359-1-dennylin0707@gmail.com>
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
index bf6db23b53e2..5d3315f71623 100644
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


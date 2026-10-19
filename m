Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752046A5F4
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390131; cv=none; b=YS3y0UX+JOAFcRPZ6VdNQetLZ+rz95xWo0cZEvzsbbFjaik1vID04Z0RUcmXjLJajy1qaJbM+Z4+OfEMAN5NpCI/CiS5C0kmXG69p1ZBG8Y7rSZ2xRd1kL8vOlMhKPJG3QSAkjyMu9XpndYjxZmvcRXQ/a8TgqaL9jIf0birwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390131; c=relaxed/simple;
	bh=erbkwzh0D0sXhbJRE5AtavTZ5KI4iVBvPgDqcGqxj90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHrcPy+E2AhYaVUQahT3pbzFjHL2hi+ORUxmSL0zLYDnn8HJOC5LHQpz8x3BQ9OVOQq0Xz+od1GBI6GguKuVjDpiQLqou1Wb+n0MKzPdNOCgr1wyx2p49YCrqdoNmoWDCZxV1vRI3pAs/aaFCFixjCr1QmvQIuvTfwZ1GD3Y0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bjqdir55; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bjqdir55"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35ef6b49813so3375091eec.0
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 23:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390130; x=1792994930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=Bjqdir55vnNLJI5P2XOA3kxnnvpiJZASMQvskO6BPZlc1EjbCU30RQCjP+1jxo0BCs
         Ul9hSHqXfzigf/EDwE/R9sets+YQOyRfdfJf9dCazTs0FI1UctbTYAwqayKtKT/JbtMx
         Jav9XzRalXMjKFdt/zwIbjsWjvLvnzas3oaJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390130; x=1792994930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=Vm1TPGQjg7aOqDi5cYe9aUOz0BEg0mLEEnODg+RJz32aUEFzDt25Fq7WAk29n7zUBz
         v7hzJIUuz+EXp0t8oI9H28ZhFRshWaUxPgHw/VSeQn79RsdOnUwce6iOd/jr4eN3qCc4
         n08yVYI94pVzdmX3+7vzCwgMuN0mFtYwGk2AUt2glLOD1ww7wr+N0g7DLER/ZOKMkUg1
         l1bv6ZCpsCXiBGtPD1JtLbF68w9QvI5VSXuG4rGBiZIGcyHDg8IcJA3DRIpYyEhLyZ5b
         O5NRYMxOGF5LWAo3adH9eAiqy1mh+B/f2iD1cJOdDJh82gLJ3kz5Ixe1uES/4ESCmG5U
         a/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBylIWvYKfQ0kR/MbabftfkTpttscezSJNBJg9li7r4pHBcjFJmaz3ZK2q9O5kUpC8+KNcGahmMH/aEKTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCfuh2VSYklIjmJ0+N2mZALD9K58mLuPmG1gzijSMStNI91rxj
	S9HKvMxkpcuoO2jwSS73D5iuc+Zc6EGLBcf/Ezke3PjuCBqT5S5N8i7wVwFBErVLCW5CR2Ndnhu
	BQEI=
X-Gm-Gg: AYBFou17mUzb9h2+OLZpgVwvjsAOeBzLbUbvVHFQQjAXs+Gas8ZW54U9cQpl1fR03Az
	/ZhzFjQCLkISkl0DB1Zx7H9nSjRJUCRUYpuRX5DmrEDWEEPr6NBTl8pmLG9OkKDZsTB1PnEbpeT
	VTJi014Yh/+OXNvPtCPN0DqbBfcivPEiawJWtuz0F9d609FFat0hLEIvOl1hzC4Rx9ZTUDIl7Od
	IF6Ps2HOBroZM01zCEskcbxiqAODIrX/VRsYtOjyosRYokw3LcFti/L7qJpYcoeFUHV0Vk6QhIc
	hac4D0hFVAQ+uaMcZ53Xc1hlO8bgH9B8Pqjzo+NXnczE1y7Nr8noaVn+2THriiO6bUsCfzSWRMz
	ezcN3p45iZkqLxRJWXNCvJqlg2S1k9k//Wg2lFr1ay9TINzjMtNV7ewCKj/yods5rvBR6/rQL9C
	TmaHkLgOAi0KPqvOqQoDunj4bjlb1rWC11gtHEbrZE+UFUSeS/oKfUn/D8c7LYO1pesx8TAYVPM
	O5Bmmd8FYmO5WgGYLni7ctNRbYnOMRirI2yCZuSqnRBTDp2ZJMJ2n2r9w==
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9287698c88.23.1792390129597;
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Mon, 19 Oct 2026 14:06:18 +0800
Message-ID: <20261019060825.4163770-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.


Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.176.g3575e65682-goog


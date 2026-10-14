Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED14364935
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 02:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946161; cv=none; b=fHsPPO8+xfIvcOQtBxL0SKiNNQqRKdnQqyOpJNw2/yu0FsC5x1/yboDGR+FcD6RPKQC69GzxO+fNXn3wUSm4vzLcKG5u8/gdCfFsXJ6nPhy87w/az22AwiMbY9teVLiobIjzODcv/mqvSvEiUEEAbpW9ZIZlu3N8sgiSpFcmWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946161; c=relaxed/simple;
	bh=+3SLjeuMdrynz9l40dS2Jq5P89i68VuZOoPVhtkeOjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EceNX5/GHQQo5UH7Qa8RCd7xO0NSuYdVvmE45zLrwLgNmlAbpDpeYQITMrU3vKGAnrRqNwkuhzlWPtKERYujSF3kv9ASI6V8tawE//3laBsftYXBU2sR5U5RthrSD+1QLGais9AF7inmjAH50VOFGS3GIGjQN1I+af2klymo6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JalSAVTf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JalSAVTf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so214200a91.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 19:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791946158; x=1792550958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3ebFU2EzDxFvfDoimfKN4m5wsDUUHnrmGXuZIPxGIs=;
        b=JalSAVTfuxJVerCPLf/hixYMHp/eir6oI9yL6lAw0lZHjloD18Ovur9U0zhypnOwup
         wYSwAdwjYR66fRyqXXRbn89drNT7bCQz9tZ5rCwQfdFl2r78UijOD8bH8/hGe/2Kg3vC
         jwQKLgs6+jmvjlH0vp0n36cyUbbbCIfJoKzq0gHJvoxjHtvs+pkYyzkbg+wB7Kfr7khp
         4wv5RlhAXLXAQTF1PI+555QiTO93vyHVV/hwUuswl8fQ9duiiP7bjXC8eAn/roKpOCS+
         z9/mpNX4OE88S1XmEvCj0xE9j2zyE+980DEefUAtAqE3O7OIyn4wyxD6LYnviYgTObwD
         OgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946158; x=1792550958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3ebFU2EzDxFvfDoimfKN4m5wsDUUHnrmGXuZIPxGIs=;
        b=aw23qySBcf69fcPUEyJubAP7/BJYdq9QrBz15J7MY+93e+suCgpthGnarwEdMho/3H
         zW02boFOu2Xbo+PJ5l/ywnCYC/cDjqC3donVdSu/LC0NBA2JFb/Io3TEcUhiXIoQv0jF
         olofrjFC7p7rZIQ4luvbshEJrMd4RuBNSWIYLIeub5v3tu9n2Mw2VcRdeAYc8hXp7n0o
         r/2natKVhyKBJCfgoX857RkaZ8mW5XdrbHb9rkxop913PltzXUi0UPvK0fVyaajnsCK8
         FhZg5VgSSTEAvBU2gLGFZRivFY+YXHtooZw9inaMLQ4UynvtjReNJ8cJX2Shee8kptnB
         Hjgw==
X-Forwarded-Encrypted: i=1; AKwUvBzVa3kY1147ThDKUt/2YayKW1tac+/v834DPayqh054CkgmR5aiRS+oO4az/DIO2jhZmci4z5UlMjgx0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ88muZXP8dGtd7ElFJsLpWsyLzmKmMkH0s0OdWzG9zaann2BGU
	+KaSvHo83yLHAOuPajkGmhhJGS9NRX9+lAbQFiwcfHTCZAK9UfzIOF5T
X-Gm-Gg: AYBFou0AaQRaUITbLctxTc5Y+/bEfppoAD9BIBfG5gWhSR1HPeP1gNVWYgAq/FR987A
	u52ayNV6ZPw0ev06RXRw6GF5NljAGoetfbJ+dHjXjmm0WoFkFwWHwD+7NrZ2TT6OVUuLslvig1U
	qYK/VEGn7VcCgjyz39/TfYxFayCsc9lcQD+thGKIhdKHQFas4nccqr/BqlXF9IPgKl4b5tTfl4e
	x/mVlMK3VbKJILNO8cWD93JlNsM+JzTkfyoYwTc/WnS0ixaSEVQANBbVZFkM7qoleqd59rscd8m
	m0Vcewy8VMkSUmUZPeylQN45c68khMP43vW2guqmi0GG76weSZLy6/uLLAlYVWB3RzVyjtxPfXW
	JzW1VzdskPI3dF4yGtofNtw2FoGl8aftBenSxTtSwmg0MopO/I/VcOzfAHZXhvoVUyM8MzhIK5A
	pik+WMh1ihzPCspAWvGI5DMFKuboQVv6QJ3Hrb3AsciLy3Ez/rbcZRvJ+w61t5iQP/LSFonPlwi
	7wKXjxlg08KlIroYTKzt6FPONPR
X-Received: by 2002:a17:90b:390d:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3ab3a7a42bamr12455478a91.48.1791946157601;
        Tue, 13 Oct 2026 19:49:17 -0700 (PDT)
Received: from drobotics-thinkpad-t14p-gen-1.. ([183.243.208.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6069ca91sm2227687a91.12.2026.10.13.19.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:49:17 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: christian.koenig@amd.com
Cc: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v2] dma-buf/test: add KUnit case for dma_fence_dedup_array() empty input
Date: Wed, 14 Oct 2026 10:49:09 +0800
Message-Id: <20261014024909.1769215-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630060436.1527498-1-shoubaineng@gmail.com>
References: <20260630060436.1527498-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a KUnit case verifying that dma_fence_dedup_array() returns 0,
not 1, when called with num_fences == 0. This locks down the
contract documented in the kernel-doc and prevents a regression
of commit 77a9298741f8 ("dma-fence: Make dma_fence_dedup_array()
robust against 0-count input").

Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---

Changes in v2:
- Add Reviewed-by from Christian.
- Rebase onto v7.3-rc7.

 drivers/dma-buf/st-dma-fence-unwrap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4d9d313b460c..c5353b36f0e4 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -370,6 +370,15 @@ static void test_unwrap_merge_seqno(struct kunit *test)
 	dma_fence_put(f1);
 }
 
+static void test_dedup_empty(struct kunit *test)
+{
+	struct dma_fence *fence[1] = { NULL };
+	int ret;
+
+	ret = dma_fence_dedup_array(fence, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
 static void test_unwrap_merge_order(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
@@ -595,6 +604,7 @@ static struct kunit_case dma_fence_unwrap_cases[] = {
 	KUNIT_CASE(test_unwrap_merge_order),
 	KUNIT_CASE(test_unwrap_merge_complex),
 	KUNIT_CASE(test_unwrap_merge_complex_seqno),
+	KUNIT_CASE(test_dedup_empty),
 	{}
 };
 
-- 
2.34.1


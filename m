Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75043B19DC
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484043; cv=none; b=Sseb/KsdL4xRI98zYSwtlxgUAfYrzFyM24mvMJnV7rmLaXBcbTZSeSFYSp51Xzgu1knhIHUUG96rRIwmFm+6YYNvrKPg+OVNuzVYctoCg8z9V54Lorq/lX8i9u8qyNCMLh0Q2EOFIZzxPyC7P6AR7qzitX4BConbAjrFva5cNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484043; c=relaxed/simple;
	bh=3ZUCrrDmOM7VZSnp6sdBGE5jCnwQNOc5dOPQ5kzHMhY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYdOZf8LlKbt/KAe9HsPZVdC6T5AwyLRofFbpmyrpqanKfKnhqYYN3uFL3WGspyTKn5EY9q3as8dm1H9rOhZC8Pct35TGlpeBiZmF6u5fo1o/ekM3x6jBTLmHe45g7wpO+jK5Ke1N0rvt1WzagkYOBbD2XbOonAo3zYdDqWlAIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTLlA9rH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTLlA9rH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceb096e675so90504855ad.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484038; x=1785088838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gQVLUSh0YdJH3i5yQlMay6TXyEhugldDrvm9uMupsBE=;
        b=QTLlA9rHWIK0Vnp1Ey6riUy+3O96WDDoonJhkTa5NECsZ6WgVN+k7ZeMrBxFKaCikw
         4zrNyTlDgbRJSmJ0OmsRDRQG/WLb1swaWwawANU8YLCnckGuckHJQMkqvK6x3TARla5E
         GyV8AjxPcY4TwgLiFFhxJljoiCkyP+Aj3CRaAwnRhkWVmFJAuGnM0C2VOpIo9jdWR1U1
         0lsMi2pNvAhqkuVUr4mMYg9GpBEuwCOelo7+JpDkqrhWQCJFI/TbsFsPSil9MqXnuNxW
         oqJ2hGQKX/j0NS/8mptF6XX6RPpynQf5ljUbZ/DqzOBhy7TZQYfXU0LUKZ2vA9H0MSDD
         YnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484038; x=1785088838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gQVLUSh0YdJH3i5yQlMay6TXyEhugldDrvm9uMupsBE=;
        b=O9emwegSe7DXvYdoD5NHaI1uAg4inoxeOvJ7e2OKD/2NR3jD9xcr0oAFSZCw8Go0fW
         uJGz4sEcfOhLywnDHKtTEEaU2whSvWViLmF9KeK6U598kPu4gvQUlmM6FK5b9iO8Eur+
         Ds+emxSbjTcjhYD+BDrvND2ij+L/9nI10ecUueuOIG6D/uZ/tD8bAxbLQFkfAJDC0bTY
         zieNtvWE5yFfjrlnRcJ7WcURKXLPGcekSNCH8ICrcY1iXNBfFmQYhunTVW1Zd2b4k+ff
         1DsUPxJxgISHfJXEyqNGr1pLdCyYqmMpNo63HP9dm0EyN/YUPdR1Xy6ayhcG9YGZwrlo
         8WPA==
X-Forwarded-Encrypted: i=1; AHgh+RpDd5nQYscqFrcN9jngOO5Kfz3Bi2p9QVllFIz5vDJZYImJ24PGA6WxKKwFfTiSSIIxZkGmcCW+3EVh3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVeCLJqX7s4kDfs+7KBnqEM58GYXfWepbZrISz79eJc2hJQJu
	RXK/TrKIwYPyrGYXhv/7//txdBnHzP5c/a8MI94jrlqDGUIYQh8nV+k+
X-Gm-Gg: AfdE7cmkONQ09rH7RlNiu4nckrtxwQiByjuB/GpsCn5oSYn/flYl2ENnAjO6HxFefi5
	xTOh4iYrNggZ16nY8r+LekJryblCrRdP6D8VDY1b4iHHrkpih4azcvfvJjJCcIllCEvgF7d7Mm6
	Wn/uKnkgFqSplCZlNJRT8Zpr3GwbsMtRsz1rT5QToQjDZvRUN+Fzd+xs7r6+YVKdJwCl7WnW88/
	r2EfM8SPnOfL3CVxRg9NQqEfA1Z0L/XxpwPj9ZC+J2kbSRcOm1B85UIkkYuOyQNHupBSZmW7R3T
	MuXN5v1eLc0FSEMKo75cY/4w40lz26P/l168Um+ICDAKLNlFI92QxVtXOdJP/+3voXiTYfnGOMS
	+gnIW0LH/zAApvNa0Rhz/n1ZdP0V0ClZzwUI4dgxMyvNqgUgVDJ9D1NnWEHTexu8bbw==
X-Received: by 2002:a17:902:fc44:b0:2cc:b480:28ba with SMTP id d9443c01a7336-2cf34a25ab6mr120497085ad.44.1784484037543;
        Sun, 19 Jul 2026 11:00:37 -0700 (PDT)
Received: from ap.. ([182.213.254.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34769bd6sm43511065ad.74.2026.07.19.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:00:36 -0700 (PDT)
From: Taehee Yoo <ap420073@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Alexei Starovoitov <ast@kernel.org>,
	amd-gfx@lists.freedesktop.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bill Wendling <morbo@google.com>,
	bpf@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Eric Dumazet <edumazet@google.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Hoyeon Lee <hoyeon.rhee@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Michael Chan <michael.chan@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Simon Horman <horms@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Taehee Yoo <ap420073@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [RFC PATCH net-next 05/13] bpf: offload: allow PERCPU_ARRAY maps for offloaded programs
Date: Sun, 19 Jul 2026 17:58:49 +0000
Message-ID: <20260719175857.4071636-6-ap420073@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719175857.4071636-1-ap420073@gmail.com>
References: <20260719175857.4071636-1-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The knod BPF offload keeps hot per-CPU statistics in a PERCPU_ARRAY
map that is mirrored into accelerator memory and aggregated back on the
host.  Permit this map type on the offload path.

Signed-off-by: Taehee Yoo <ap420073@gmail.com>
(cherry picked from commit c447c9012940d48c1ec20a8ebac8d779e7d5a6fa)
---
 kernel/bpf/offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index 0d6f5569588c..36e747a12cbe 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -510,7 +510,8 @@ struct bpf_map *bpf_map_offload_map_alloc(union bpf_attr *attr)
 	if (!capable(CAP_SYS_ADMIN))
 		return ERR_PTR(-EPERM);
 	if (attr->map_type != BPF_MAP_TYPE_ARRAY &&
-	    attr->map_type != BPF_MAP_TYPE_HASH)
+	    attr->map_type != BPF_MAP_TYPE_HASH &&
+	    attr->map_type != BPF_MAP_TYPE_PERCPU_ARRAY)
 		return ERR_PTR(-EINVAL);
 
 	offmap = bpf_map_area_alloc(sizeof(*offmap), NUMA_NO_NODE);
-- 
2.43.0


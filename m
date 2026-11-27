Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774839;
	b=rsd70g4a/W13RSMRcE4fU01FB9Fbrw3rVabQzzQsOvemrhIvGQaJwYEzxEz4GwiT9AQa
	 Y1O4DtdiRE3VZCbXlY+Tivjrsa0iEPAdCvkwvFE7EacRcTgHUpm38MWLCSw6vhpHy49nE
	 bmHzg4fiscfi/6inS0m3y6NH6GsExaTjPbveGiDpRVUl5fMm29DaUd670Jkw++9GIamZ2
	 bPX7hzvhymi4WwNEbfy9dWKClZJfdEsiA2qkU9b+9It+BXxMhl3i9LDcyAZvf0+58j0Yy
	 nFRNaL7qV5kuBWr7IqLhwsHHfTKwhPqFqjeGz+sFwbXP9e7r1Xf3rEcZ6fmRTHOBJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774839;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=l1oAF/DiYNS3X/YLQAQd9jHYIgVJICE43BOpftyq7DM=;
	b=xVkwzd95qeJv4vX/D32e7ynEShdhFYZaySaQHcFTYYmhZBe65qi/+Vx7sRKSGj+TB/8g
	 c6TFFldnpnqZzoTV9opQCwT4IqMQ5VEA4akUegMxxNhxaamjDrq5+qGYA2nCTAKkEtVCW
	 zpdlzmL4DfFC+K6GlQVrWoNo8X8On76ZdfCNNaJimfIfOj1R1YuL79+s3zo+8EDsn4QIc
	 nJy/2iFFNkm6TeC8FNuLlAcm5bWgz1XaWOYt1RmOBP34rOzcvMoBjsXHzjULKWtkurIYU
	 GqvBGHVW/uzaqoQ/IV9aITWEsdo0QPXfRVruCbSaAuvAmlHIzGUKXmyScLUGLJoR9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qji4ixgx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B6F606A31E;
	Fri, 27 Nov 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qji4ixgx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D50F1F00929;
	Fri, 27 Nov 2026 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774838;
	bh=l1oAF/DiYNS3X/YLQAQd9jHYIgVJICE43BOpftyq7DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qji4ixgxNe/uPnxNQATM7G79DPAjqHzxro0BE4Uy8CMXl+3avk6TCqY90BEl2Bn/a
	 nWjAYt40p2SaRX937+fv6Jhp/JKfWJSOAe5IzitvMdKA9RsO43q5xLK7otJO7TkLCV
	 cx2oLFERKILvx/J2ICzjmVzwtkf9kJ0Iz0KOWtHku3VgQ2H+XXrrN+ovaBrDfIth3O
	 FKXEkop+4Sq8uFRdsL6e/kHIFf1NNVJSBZWLUbgwsZYvMx9FDtL0u6NsJMjq4098zX
	 P0+FWHnJ3VMZVjT+N0JL969edrs4uTnl3+HOBJzaMlEUkiQ7fGnw7Vco8yk4cyRhRR
	 GlfvGrL9hPijQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Ruslan Vagner <rusya92266@gmail.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 6/8] dma-buf: sync_debug: don't use TIMESTAMP bit
Date: Fri, 27 Nov 2026 11:18:11 +0100
Message-ID: <20261127101812.2706432-8-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127101812.2706432-2-phasta@kernel.org>
References: <20261127101812.2706432-2-phasta@kernel.org>
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

dma_fence's TIMESTAMP bit doesn't really serve a purpose and should be
removed. Direct accessors should therefore be ported.

Use dma_fence_timestamp() in sync_debug.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/sync_debug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 9e5d662cd4e8..58c0d00ba5b3 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -46,6 +46,8 @@ static void sync_print_fence(struct seq_file *s,
 			     struct dma_fence *fence, bool show)
 {
 	struct sync_timeline *parent = dma_fence_parent(fence);
+	struct timespec64 ts64;
+	ktime_t ts;
 	int status;
 
 	status = dma_fence_get_status_locked(fence);
@@ -55,10 +57,8 @@ static void sync_print_fence(struct seq_file *s,
 		   show ? "_" : "",
 		   sync_status_str(status));
 
-	if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags)) {
-		struct timespec64 ts64 =
-			ktime_to_timespec64(fence->timestamp);
-
+	if (dma_fence_timestamp(fence, &ts) == 0) {
+		ts64 = ktime_to_timespec64(ts);
 		seq_printf(s, "@%ptSp", &ts64);
 	}
 
-- 
2.56.0


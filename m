Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425060;
	b=xPeOXpk+6ZqnvOhG5OzfNbrvRDQxe5caJDC/5XsnU+DU36BhxWYxIdzKijySBu8xyv9N
	 I04OhWJqxS496ZklMVS0WaVj/2jxIRmwz/PQSpEvg0AAEsvX1HFZc38BwzwqKVaR+sQ6Z
	 yK495uQXk0WxvODSrd6YtXIbKrhfC+FoBCRgFTBTdGAU6QQCjsH27Z0QmBBa+pVN3uXjh
	 wnVyXfTsebZZcvn0ar7/T4f2Ho06vRpXtRBb9xnfFkhAxq9D2kZ340Vk8ncy3SgWikqbp
	 xkqNGwG5KGs5XXV+kOmkmbQ6FMOkaxTbxgqR8bgcJQiSFQPNcDdd+7r7DIEGCaEcyGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jeGS53i3H2ZA/AB75TkRMSZsgx42pQ2yxXWF/NRY1NA=;
	b=GcS/DKcFBRUtHl4wJdsKn1I7gDr8MljLG7E29HYPcAnwAW8EKGpnWb1FYgBGamG7vcGD
	 ncAT+KmqN9vZpzR91ZMv9M/DyqvMLZo+9vIXVx6m0/p+uQjEhDGAOO5xZSKoJPU9Sxx2f
	 swKcrh9BsoP9qJwd7yrjZmu8I52rBBxuIALkiBRAU21d6mJoIXNl6/hsd4XKz4f+y+rsw
	 AnKu9rpxE4aMitQgn6VFF7VtLMMm5tq2ou2FdRDzfYkWRHW1sMDx8mLp48BqoQC5CiVFO
	 0kwm4tsZQISxOybtYFi3Ud3ViGuGmjrYT8fHsxd6piw5BIYdSWvFsdy/pkQgtMj/bpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkqVn92;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4860A260E
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 19:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA4860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkqVn92
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45ecb9dd589so2505682fac.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425059; x=1795029859; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeGS53i3H2ZA/AB75TkRMSZsgx42pQ2yxXWF/NRY1NA=;
        b=cQkqVn92T4Oui/+VCglZgs8fJXAig6R5l+VclvZ+Jt0ppAVZz4yDq1yK/FyJHtdx+g
         Y9AiC9GzQYqQro0gB91+f6zfs0CI38Rz0k7LPkpjFOsYWA1zXOu+8tnZI0ih0tUHOjom
         VABERVCjvucj3eWe0UUcbmbkNqpagIeM/SCJrDtbrSlGJHN/SVcH+SjdOaXs54xDLKp5
         dW5KWH23Ywn8CdnSF45Z/tKhvFCVaL2W1JCCVW2w6DdjUey1K/IgHSnBZoUUdTv33CKi
         h38Ig4xOV5fIjWj+37pSTKurD5RI10wq9TInvnW5n07x3XTcdyNRemmhhvbbzPFv3JFc
         9MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425059; x=1795029859;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeGS53i3H2ZA/AB75TkRMSZsgx42pQ2yxXWF/NRY1NA=;
        b=LhSykcWn7+9P5i+wXGzoFzBiAft9Fa8KKKMFEn5M1YBnX5S7nEmly4nH0Jx/RRwSXH
         NGR9GnLl1wAtCPlvdhzjUizfOwNgSe7exRaxXH/hTQ6tIV1ujNp9kp8gA7eW6YKuh1CV
         LYIc2X09KCJmM9yq9b4GfXc24kni0XgQ4lrhlm35JvePB0aoszs4gFrlM9BL0Z3Qab7A
         pwjcJMpPxOQQDb7WrhK/wVj2iSpSpIbClvd4iuul6JsK63RmCChQzg+MYBQbh5NJgmEW
         o2C0w071IwUG2iOe+iN4Y7csDzbtNTa0cy/v/JQL5jKageWvRx7EQvriv+wKA9rjD4bz
         VbTA==
X-Forwarded-Encrypted: i=1; AL+hErHPPkMDPg6gXn/DVgU8EzSM30LUShUyaAZcjvF9ZTBJf56SK/jYz//iEo6tpdtFTIDikPbcou1K9rXwSA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xZ/pAqf2m/lja1MKk08d8tREB5U6JcW1fRev605fqqtl1pES/
	UhOpoidOoCiFR450ESdvDaPCBKFfjZXfke/Z91tlWh2W9b8hZOdgKC9GONjuBT8CG0mFoe5C8kv
	NeubBZLybG1XzCg==
X-Received: from jagm2.prod.google.com ([2002:a05:6638:40c2:b0:620:1989:fc1c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6809:19:20b0:567:cbf5:bb96 with SMTP id 5614622812f47-56cc533e313mr527002b6e.44.1794425059253;
 Wed, 11 Nov 2026 11:24:19 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:07 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-4-dmatlack@google.com>
Subject: [RFC PATCH 3/7] vfio: selftests: Allow multiple BDFs in VFIO_SELFTESTS_BDF
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Parse whitespace-separated PCI BDFs from VFIO_SELFTESTS_BDF in
vfio_selftests_get_bdfs() instead of requiring a single BDF.

Multi-device tests such as P2P DMA tests need two or more devices even
when invoked through run_kselftest.sh without command-line arguments.
Single-device callers using vfio_selftests_get_bdf() continue to receive
the first BDF.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/lib/libvfio.c | 53 ++++++++++++++++------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/libvfio.c b/tools/testing/selftests/vfio/lib/libvfio.c
index 3a3d1ed635c1..448d11442b53 100644
--- a/tools/testing/selftests/vfio/lib/libvfio.c
+++ b/tools/testing/selftests/vfio/lib/libvfio.c
@@ -2,6 +2,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <sys/mman.h>
 
 #include <linux/align.h>
@@ -32,38 +33,62 @@ static char **get_bdfs_cmdline(int *argc, char *argv[], int *nr_bdfs)
 	return *nr_bdfs ? &argv[i] : NULL;
 }
 
-static char *get_bdf_env(void)
+static char **get_bdfs_env(int *nr_bdfs)
 {
-	char *bdf;
+	static char **bdfs;
+	static int count;
+	char *env, *tok, *saveptr;
+	int cap = 0;
 
-	bdf = getenv("VFIO_SELFTESTS_BDF");
-	if (!bdf)
+	if (bdfs) {
+		*nr_bdfs = count;
+		return bdfs;
+	}
+
+	env = getenv("VFIO_SELFTESTS_BDF");
+	if (!env)
 		return NULL;
 
-	VFIO_ASSERT_TRUE(is_bdf(bdf), "Invalid BDF: %s\n", bdf);
-	return bdf;
+	env = strdup(env);
+	VFIO_ASSERT_NOT_NULL(env);
+
+	for (tok = strtok_r(env, " \t\n", &saveptr); tok;
+	     tok = strtok_r(NULL, " \t\n", &saveptr)) {
+		VFIO_ASSERT_TRUE(is_bdf(tok), "Invalid BDF: %s\n", tok);
+		if (count == cap) {
+			cap = cap ? cap * 2 : 4;
+			bdfs = realloc(bdfs, cap * sizeof(*bdfs));
+			VFIO_ASSERT_NOT_NULL(bdfs);
+		}
+		bdfs[count++] = tok;
+	}
+
+	if (!count) {
+		free(env);
+		return NULL;
+	}
+
+	*nr_bdfs = count;
+	return bdfs;
 }
 
 char **vfio_selftests_get_bdfs(int *argc, char *argv[], int *nr_bdfs)
 {
-	static char *env_bdf;
 	char **bdfs;
 
 	bdfs = get_bdfs_cmdline(argc, argv, nr_bdfs);
 	if (bdfs)
 		return bdfs;
 
-	env_bdf = get_bdf_env();
-	if (env_bdf) {
-		*nr_bdfs = 1;
-		return &env_bdf;
-	}
+	bdfs = get_bdfs_env(nr_bdfs);
+	if (bdfs)
+		return bdfs;
 
 	fprintf(stderr, "Unable to determine which device(s) to use, skipping test.\n");
 	fprintf(stderr, "\n");
-	fprintf(stderr, "To pass the device address via environment variable:\n");
+	fprintf(stderr, "To pass the device address(es) via environment variable:\n");
 	fprintf(stderr, "\n");
-	fprintf(stderr, "    export VFIO_SELFTESTS_BDF=\"segment:bus:device.function\"\n");
+	fprintf(stderr, "    export VFIO_SELFTESTS_BDF=\"segment:bus:device.function ...\"\n");
 	fprintf(stderr, "    %s [options]\n", argv[0]);
 	fprintf(stderr, "\n");
 	fprintf(stderr, "To pass the device address(es) via argv:\n");
-- 
2.56.0.567.gdb80ae8cd5-goog


Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AC1172E
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569862; cv=none; b=vB46Tx5SEV+qochwL6BCAxaM5bEPm1i8/GlGcxf+TpxUhXUZj9QWQGRSujSdMuu2KusOH6Uu2Xf06eGlfdJJx4J5+cY7CJdMmkg9NwCc5L89WPaBLgA+4IIfqDVqvpmCfaXASpc9nOg+drI7yUG88WfELhcuy8BfTHBHV8IqKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569862; c=relaxed/simple;
	bh=2KIiz6iGLxRFIVVJFBxG4zc9wLGsSqHTSc5A+eLla0M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=O7MvEiMv9Kje4UcDiP58DC6TMuQKmEOvQsl4cNOpzuMH42O53TeGGAvstBSbX+n7ov0b7LYXqc3nFIY2wiSCLElQ3h7n9j90sPEh37/1xyhApnrA4hPFEYjocO+TW3k54bDhLYdif38L51hrTv9F36qvqgCnXY/TeaRx+tQR7G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GmrfNZ+b; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmrfNZ+b"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so3824617a91.2
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 21:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790569859; x=1791174659; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4a/2U6MDyhfh6OctZetk7ga+hEdDkfQe/jf3hv28p0=;
        b=GmrfNZ+bAySqQzM3dC1Y9PJWS8Tb52nVM24iWDQgRS++8tj1S49rDot22RI4c7h0Jo
         /rTNzxFKHigi4PAOfXWbT2i191V+PoaN+6DPSKzT/A625zbPVNUjz0gdLL+AS3i02zVD
         98tRRMmD+Hox0CdWC0V83ETcEzS+gjdnAeL3cUrtSB2cNsyazI4iA4UfaHwCUlTwA9tx
         LdibilKWxB7wUisBd/MhgkgwuGPYWQzGe7U9/V7pt3RZ0dnw79a6TkYmn+VPmTsI0Jne
         KKjgW01js8PajIUFmpTVSj9wU6orRre2uRSAxLq5D7yeGb56Pop0nf8ltj8/Fm3S63D7
         6lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569859; x=1791174659;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4a/2U6MDyhfh6OctZetk7ga+hEdDkfQe/jf3hv28p0=;
        b=ESlZjYJaMpOeuHUmQAbUCCZNDB05AOgAXZcWiYilmsmaCyXh9XjGjhP2zZ6hiG9z1M
         nfqm5lbAzBKuRl3MFRcVVZHJt2om0EwTZcKi75afO7q9ygfe/Y6Dzmjtr8ANmz56VtTR
         HzSZN/wA0iSEj0+fB3hAQC01ZfBfpleh8T/D8rE8FizUuaKBMFme6nCn02ZKfp9uz730
         V9YHdipuESuOE3/jqyLuTNJMEUdybIm+dS1/dMJgXj/DA7rGSvRxF4vCj6LZDoELztcx
         vTNU3R30Ev2XC/FMZwsblmo0jmJsUcgJ9bQn7+CNNA97e9xsuU/yKrjolfW09DsfpBJO
         R2GQ==
X-Forwarded-Encrypted: i=1; AKwUvBx71HorgFLLAaeDmI3SGdn67jj8PX3nqmTsqN1yXNhKnhSuUQMCgKYFcVkab1DY2AyxbFZZ6h8n9a/ehA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLY1qi/PmrevDgoNwetye1BRSxGBW4HpvfMFv9M8IkgcaMF912n
	t4/Gp5NU3UB5skl5baLno9WbSMqwtN+dgW8NSbWRsNCM0zx8IXqXcQQIhV3ySSv01RospwCYK5g
	Q
X-Received: from pjqo14.prod.google.com ([2002:a17:90a:ac0e:b0:3a0:70aa:2cef])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2cb:b0:3a4:7a96:5209
 with SMTP id 98e67ed59e1d1-3a47a966299mr377611a91.33.1790569858850; Sun, 27
 Sep 2026 21:30:58 -0700 (PDT)
Date: Mon, 28 Sep 2026 04:30:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928043056.1324568-1-morbo@google.com>
Subject: [PATCH] dma-buf/dma_fence_array: Annotate fences with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The 'struct dma_fence_array' holds a pointer field 'fences' that points
to an array of 'dma_fence' pointers, and its element count is stored in
the 'num_fences' field within the same structure.

Annotate 'fences' with the '__counted_by_ptr' attribute to allow
compilers supporting this attribute to perform runtime bounds checking
via KASAN and '__builtin_dynamic_object_size'.

The structure is allocated in 'dma_fence_array_alloc()' which
initializes all fields, including 'fences' and 'num_fences', to zero.
The structure is initialized in 'dma_fence_array_init()'.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/dma-fence-array.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 0c49d7ccefb6..85e5879e8a1e 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -39,7 +39,7 @@ struct dma_fence_array {
 
 	unsigned num_fences;
 	atomic_t num_pending;
-	struct dma_fence **fences;
+	struct dma_fence **fences __counted_by_ptr(num_fences);
 
 	struct irq_work work;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


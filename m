Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586906;
	b=VZgWjqeKGOIMyjdbJLlTZ+Qn+Ek2vAB+b9hAHp48fc5qSq/xfA626YYT3avhg4HBkP6j
	 QY0jALH4eSkgV1KjPQ8o1tVvdjYFTEOcRXUGJeZTslCh19pwm7Ra60uhR50yNiIOdIOgU
	 ViHAFQI6m9/QI86a/ypgIYWHTfJ9EI2QB4tNQQER44tKFUF4G+28WMyjj7PwRal/HT+LG
	 VWEfTdDLDeDgMOoWLJTJliZL1hg+xMpJo2kowCQDKoEJkFV1/4+CRBUQ+Ad8c5zs72NmF
	 bYuVsBd59vMV9nZ0u7CKMZyM4jbep0hpwRphg5mXKERfFayJOMEM4+uhLzIfbzHZCNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586906;
	h=Received:DKIM-Signature:Date:To:Cc:From:Message-Id:Subject;
	bh=kQDlvqoHvx/TepUXKp2Bc67pNE0dmF5SNegpoPGciXc=;
	b=3nTO3TYhmMpxO3PtNCx99y6Gewz2BaDqQ1gVIE6rc0irQL52LUrUh4fVtPJ06rTRVF7A
	 04oRkQw5AWqXb2asuWEPwPS+v1UQmVPsLVRgrTWqv01emA4d8+J0loeEml86EMvDW8NcV
	 ecSZXScpjxiuY9HlX9Ot8NDjHOoIFPoFSWMrgQpwjfwKnbPGRHUoTOz06xMBih3650ky2
	 omcJpoGQFk3JSbNaiFPONz4X2784UBFg2x6R3oqpXGVHjy6rW2hvkjjit7n825q+pvrqq
	 Xc9M3YJU/uW+D4ywG4OgR/KvUJsidpd0vMbOs9+cl5GExS6oYTIHaJK2Orlc10UOTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=mV+BySkP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC2606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=mV+BySkP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A901C1F000C0;
	Wed, 25 Nov 2026 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795586905;
	bh=kQDlvqoHvx/TepUXKp2Bc67pNE0dmF5SNegpoPGciXc=;
	h=Date:To:Cc:From:Subject;
	b=mV+BySkPWa9ZZkXNO1CpBe2jOcdV5QSqd+AU3B+PHG0KVUuHdBZKKDY9hFgLTGO2G
	 RNylnV6j7bE4mgROnIlNtn5J/tjlE26zjJKY5tcPAvuidzshYY8hos1DH0Vf4AWyOp
	 1YDhCJVM4/lr81ryirYrb/VIsCTtuH8kJT97CEI8=
Date: Tue, 24 Nov 2026 22:08:25 -0800
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <382debd29a1a4e649039f61dfad4d34b.1@linux-foundation.org>
Subject: [PATCH] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

From: Andrew Morton <akpm@linux-foundation.org>
Subject: drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
Date: Tue May 26 03:14:09 PM PDT 2026

csky allmodconfig, gcc-15.2.0:

drivers/media/v4l2-core/v4l2-vp9.c: In function 'v4l2_vp9_adapt_noncoef_probs':
drivers/media/v4l2-core/v4l2-vp9.c:1834:1: error: the frame size of 1436 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

The amount of inlining in there is simply nuts.  This patch semi-randomly
uninlines various things and fixes the above.

Ad the .text size reduction is tremendous:

ts:/usr/src/25> size drivers/media/v4l2-core/v4l2-vp9.o
   text	   data	    bss	    dec	    hex	filename
  22450	     36	      0	  22486	   57d6	drivers/media/v4l2-core/v4l2-vp9.o-before
  16144	     36	      0	  16180	   3f34	drivers/media/v4l2-core/v4l2-vp9.o-after

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 drivers/media/v4l2-core/v4l2-vp9.c |   30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

--- a/drivers/media/v4l2-core/v4l2-vp9.c~drivers-media-v4l2-core-v4l2-vp9c-reduce-inlining
+++ a/drivers/media/v4l2-core/v4l2-vp9.c
@@ -1582,25 +1582,25 @@ static inline u8 noncoef_merge_prob(u8 p
  *	merge_prob(p[9], c[9], [10])
  */
 
-static inline void merge_probs_variant_a(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
+static noinline_for_stack void merge_probs_variant_a(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
 {
 	p[1] = merge_prob(p[1], c[0], c[1] + c[2], count_sat, update_factor);
 	p[2] = merge_prob(p[2], c[1], c[2], count_sat, update_factor);
 }
 
-static inline void merge_probs_variant_b(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
+static noinline_for_stack void merge_probs_variant_b(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
 {
 	p[0] = merge_prob(p[0], c[0], c[1], count_sat, update_factor);
 }
 
-static inline void merge_probs_variant_c(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_c(u8 *p, const u32 *c)
 {
 	p[0] = noncoef_merge_prob(p[0], c[2], c[1] + c[0] + c[3]);
 	p[1] = noncoef_merge_prob(p[1], c[0], c[1] + c[3]);
 	p[2] = noncoef_merge_prob(p[2], c[1], c[3]);
 }
 
-static void merge_probs_variant_d(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_d(u8 *p, const u32 *c)
 {
 	u32 sum = 0, s2;
 
@@ -1624,20 +1624,20 @@ static void merge_probs_variant_d(u8 *p,
 	p[8] = noncoef_merge_prob(p[8], c[6], c[7]);
 }
 
-static inline void merge_probs_variant_e(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_e(u8 *p, const u32 *c)
 {
 	p[0] = noncoef_merge_prob(p[0], c[0], c[1] + c[2] + c[3]);
 	p[1] = noncoef_merge_prob(p[1], c[1], c[2] + c[3]);
 	p[2] = noncoef_merge_prob(p[2], c[2], c[3]);
 }
 
-static inline void merge_probs_variant_f(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_f(u8 *p, const u32 *c)
 {
 	p[0] = noncoef_merge_prob(p[0], c[0], c[1] + c[2]);
 	p[1] = noncoef_merge_prob(p[1], c[1], c[2]);
 }
 
-static void merge_probs_variant_g(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_g(u8 *p, const u32 *c)
 {
 	u32 sum;
 
@@ -1659,12 +1659,12 @@ static void merge_probs_variant_g(u8 *p,
 }
 
 /* 8.4.3 Coefficient probability adaptation process */
-static inline void adapt_probs_variant_a_coef(u8 *p, const u32 *c, u32 update_factor)
+static noinline_for_stack void adapt_probs_variant_a_coef(u8 *p, const u32 *c, u32 update_factor)
 {
 	merge_probs_variant_a(p, c, 24, update_factor);
 }
 
-static inline void adapt_probs_variant_b_coef(u8 *p, const u32 *c, u32 update_factor)
+static noinline_for_stack void adapt_probs_variant_b_coef(u8 *p, const u32 *c, u32 update_factor)
 {
 	merge_probs_variant_b(p, c, 24, update_factor);
 }
@@ -1724,33 +1724,33 @@ static inline void adapt_probs_variant_b
 	merge_probs_variant_b(p, c, 20, 128);
 }
 
-static inline void adapt_probs_variant_c(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_c(u8 *p, const u32 *c)
 {
 	merge_probs_variant_c(p, c);
 }
 
-static inline void adapt_probs_variant_d(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_d(u8 *p, const u32 *c)
 {
 	merge_probs_variant_d(p, c);
 }
 
-static inline void adapt_probs_variant_e(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_e(u8 *p, const u32 *c)
 {
 	merge_probs_variant_e(p, c);
 }
 
-static inline void adapt_probs_variant_f(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_f(u8 *p, const u32 *c)
 {
 	merge_probs_variant_f(p, c);
 }
 
-static inline void adapt_probs_variant_g(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_g(u8 *p, const u32 *c)
 {
 	merge_probs_variant_g(p, c);
 }
 
 /* 8.4.4 Non coefficient probability adaptation process, adapt_prob() */
-static inline u8 adapt_prob(u8 prob, const u32 counts[2])
+static noinline_for_stack u8 adapt_prob(u8 prob, const u32 counts[2])
 {
 	return noncoef_merge_prob(prob, counts[0], counts[1]);
 }
_

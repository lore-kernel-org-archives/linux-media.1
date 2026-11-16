Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848926;
	b=45jlkUITJW66zzRAkZyGk55V0xXRRN6rdBUr86uAMzPFHyr04QYFSc/gLfjhvksZfIJw
	 4AedPhnEpiDqAVJJGFOHIsVPAe3vPmIOWpHsvT2sP1vWg8M/qsu/U7bWw960Qc6HGJruT
	 ZPtMJjQrVt8BC5HRslIYoZMCLBsSygnDH7H5mO7dnsEpt+6b7xaL3EfDTaaQfhqNe+CBL
	 s/ab7I43JoYF3TwjwMOAcWADwP6qGqHJalYD+MSo8XQrm5M+JgFTa/hIRyHXE9KfyGUAk
	 REeXec1TjEI+af2Lz4crOdKI44FeCAtqx61iNbJo6rlA8MjOAF8F5XWoje91VFdkUjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
	b=0h9UND2K7bTc2n11P4JONeq55kGwg47Pw2hGO7FVEam3GBpRt0EaOOhXqWqwfS8J2OCI
	 tpB9YAvmOgn7flidhhY8DTUwZouJlLXJTvV4NvvEek/QcsGSTH46mt215F8BK8UICxBqk
	 RVpvV84w6MAcCRHkRWj0fPT8owVEzZQuEpPYF/QFtAV/9VMNN+WwuH1c3RFAp96rQaA1q
	 bJyh1RGOCUQiJRwVNvC49c7fSgMJ/kyOgYCnObqmzw1ShmCHtgdwpdGVVCTpnSB4zblBk
	 qU9q0YqErq+XKfTQpbYcR3rWn4tTu5G4qFz2LDptf3R99GkK68uy1Lhp8/UAm5KadGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tjc0ItRs;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C95606A331
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C95606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tjc0ItRs
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so3494466a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848925; x=1795453725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
        b=Tjc0ItRsiNh1Ydt0eH21UKlLI5UTGiv3uUB5nJmX9NZGSnd0wwtR4q4QBCUY0H1JIo
         9dZf5fh8Zj62SEOjq80jNWWUr+zaN9XedMQ/8UO7vDiyXdTm5sch3gI+BGiSB0hnuOEp
         Be3ZbKtXmpCVvSSOPKrdlXXZSUgyIMnFtTIbhk0X2IL2PAX0ZgZSxhsh2msvjdPaHksO
         4wxZfMpR+vDTyVwb33P/nfLJ3m1h0yCr8lTC5lKRqlyFw7K8X7dsBAHFO+00rJo9KZWE
         repFeAcED5nKlxa7zpK8NnjuuG7PitB4FHB2whfJuUe/ny2jRnVJrkfiPrXJnUhCIjNH
         FHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848925; x=1795453725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
        b=0cb5Q555fcdcNF0FfVhUmD9NjsS6oZ4Glgmf8F1YPKzi4zkw9HpLmleQeBiAX78STD
         owLBekX2zuKnI+qszLxhHRcaiJbRfNzSBibZmKMhEgJnq7ms/25SJThsJ4YO6Y1C61Jn
         aXwuRIIjYM9qqFxuqitxsvKKteLWvRZPB9RxxywUXU2+NWP5P7RJVnxHuSJayUApR3/t
         nS+b+kYh56Vi+ThmqSJTP+z+/W+DltPnpCvv0cBXdG37ueyfCZ5kwcLM1dgIbaKCv76/
         /u//gow1ccxXW+ElNpioaFScLkM9TJJPSN7pqNy/tJaAYJTrwdA8YGwQhPowVjmFBLHr
         CRbw==
X-Forwarded-Encrypted: i=1; AL+hErEa1b2PFjIrwoHbNE9fRsTbWxjxPjxiH9j+b/zsYL+uFDLCiT2/2/BZgYYfmfuyMA/DMR8bqJzOcwwIdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8u1YBlyO8HCiGcnD+jIeZEy3/FCLuQGITKGPlvcUQvEL8lc2cq
	v+2/9YW4k9jCTTbb9vC9gyX+l7eequcvrlEyNrh29v3M+JfkVIzKWcaqeZWj4m09
X-Gm-Gg: AZFdTZeUQY2YMdzLLJaYf8XluZqqqGZTakDzQXLfJZOWOF8UeSTYFNlPl+CJG4pqhTS
	4uSB9ngWbMZjXXqxRzvKornoWntes0jHN+SWe4yAtGLLxk3glltvJlCsmsUoMApRrlUD4s351ex
	40Sp34dgxgfN6XpdegEIcBMkqK6VSSdzydb8Jut0s/QOixr5rA32WY6o0QucHxEa7MFhiqUZ3oT
	slmJEXVo6SX5CA+mAq5DkV/NH5Dyw45ANSjgvF2NAOclyP50N0sT8PXiF/opuxucGYos5dLwl+M
	GF/d+BRjlWqfRguJJbOJZGRPMn4XK+khDjgtJOlzakoPeo/fXUWH4mjSqMHTaAfqP+7Ezkz6Tuv
	oSMIxvAz5HKTkai1B2U4Ct0O+KU6CtgvdLSSTmBMLiMD2IXVWOUkaxH4k12Qmm6YEMsfkXIeza7
	m3USELn3RllVHupjDSWLHsinccGiIrcEgvLjNG7NuwK+mfj3kXUuTIQ75PNLHXVmGuRwufllUh6
	ggQDPnhDD2mJ2yutf7cyZ1/++DPouhBelOYtqF0ZdwJwkiVfTB5hrQwLGRSgTV8JTKnS4wg/Klr
	lw6GdXvJtLj/Ef09elo0JgUU6WjAY9297tXRzu3pv3j7a3B8Qb5HPC+8/Fy7D30PEYe0RByAng=
	=
X-Received: by 2002:a17:90b:3146:b0:3b0:9a13:c5d5 with SMTP id 98e67ed59e1d1-3b1b0b57dd8mr10208977a91.16.1794848924812;
        Mon, 16 Nov 2026 09:08:44 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:43 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 3/3] media: atomisp: Remove unused hmm_flush()
Date: Mon, 16 Nov 2026 17:08:13 +0000
Message-ID: <9afbe32e2a98cc194d84f26e6fcfe452e2b09e5e.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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

hmm_flush() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f5..545bb52c5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,7 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
 
 /*
  * get kernel memory physical address from ISP virtual address.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f9..5dff2edb5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -262,12 +262,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 	return load_and_flush(virt, data, bytes);
 }
 
-/* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
-- 
2.43.0


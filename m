Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=bFhm8B/NrgglD2DRYZeXvyH2sAGhLmKiTvZZiExKWwnM6cOYF8moP4jT1fTM7kszNeKZ
	 MDHIXL4YfNEBbjjXDTjjn8eb23aug4NOoiCDTFl8CnKk9Mq9v+E15VLNW5ApqGnhFXWBW
	 tFJ/rDDPsw4AGh4k23KrgYrLUanvGUDR8RYBsZTqoMKiQEolsKkyy5I4T5usWMbUdtvdu
	 G6Ks6OrA+FlUvwxW+RmK9BQpjF+NbYY1SmsN3p89ZNR2Gd3W5L7qGcEQfsTLP+/dy6NcP
	 9/ip6Po0M+OE4fgo2pGKMGz8pwaseihWMQdDmHpqjZfRa27Ih8kyE10x7C/yyIvZl9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
	b=jv72/gg2BB19QPmGc02eyVMyOqQQlsORvTDCkkZoKlG/O3WrKCr580KIg0G0SEM/wXIs
	 +Pjyh7sRwhaUWsJWnJwTKGGreh3dNiwBB8xflb0F4erZXuV7Gb4dcGoqv+kX5+mTbfTny
	 z4/mVh4Ot/wvJdwlHKC/VMFRjoLlGppRTK4cnU9MY3q45jg+EPqBPmD4sJDqaTOAYzsal
	 flEsmv080D6wdWpTENLBNfEt/OFiz9it9m/s0ioaM8HkXM7k1Xku5S2rvTToL2aXYG5I9
	 R0h+CGMD3H3IyXUxrUWcI29lQynbrkAzVpjjQdnxnU+JqpYPz75z4mLNUJAYSPctxvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=moIq1vOE;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4253606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4253606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=moIq1vOE
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso4360885a12.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102640; x=1793707440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
        b=moIq1vOEWswM1P/seFXL51p+XVLibcFHi3dRCGTx/U6m/GnxMhjRL/MqnktkDVOtyh
         P1K6XFA8W/sl4WAqhPuB0Ul2o69NxX6EZtngg8tg2WjtRdlM47a766WPuYidm5k7CCRL
         wiEcN9FghZtoH2Cv1Aobq1cBM+tVJuAfg2c5ff+MFlJwEIFIC+kwXIvUAT5OXa+svdGd
         tnXphJqtzPzI7xMm1vLHSefPwcYiA2UKYQkslXR9iIP3QOUKMC/L+helhZGtblRZV/wG
         zyk5D+L00en9nK8TOsp322IHaOyTN89FIgPME7OXiLbjBt3g9BVTrKdRTPGCyiIpKQYP
         9iGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102640; x=1793707440;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
        b=Tex2AhQZOE1vHTS0BXWLdfLqf816J5MGaHAklNW48yxT+mVWOdRbSmLIt1srPtSJJT
         0+KYY3pm0srxiIYzQqGeBgCBXFlXm9BiW+RTVwn+TEj3NqP9PeK0nF0lcIfTHNXyg5py
         U2UPZ4UhmlnZZugJCFhNN1VvH5wr7fiGFhKae4ZJuzIaxOG2gtd/ZQKCXvrsSDdFd7Od
         N6u7hEg9OKkA1DaNcqjNng2UDIM6X6nZLaeOcsfvtCPwMD/cZv4Q/Hkq+QKNa4Cq8Ju/
         fhaQGvLZsPud7d3SwYX3bpLuS1AF/YF+uXKoAloXQ8Prz2bcu4Wtmbzc3af628ii/G0t
         wUQw==
X-Forwarded-Encrypted: i=1; AKwUvBx7u/8vrgplNS5y45r4zbxIGS5dGRYFDMHX4EI0jeE2R0mqGNooBaS/5xplWaFSZV+/CBjnNAf0UcE1fQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQw2T53bsOjNgnNL/G8NwZK6RVQ0Y4msHEC7Wr7zpihwnnwQoA
	wZwh2JJbIo54RQKSvKbSmeO2p7WVh7AKjhOcfzVASKsa80HrYQUZNYJ9
X-Gm-Gg: AYBFou0kU0+DM5jxnR1UVs13hOtPbRrK2tj19k8TTDr2+iQ6sbWwflJ5oBVlul8k1Cc
	sUrhbAmW/NHfmW81JbDM4E+cYXXb65ixJC2NLqHhyNNdlpNOCKJQ+STT0TPZsJjnUeOFdP/9wxR
	V1iHTPZz4nWOE2x12gHDBRJnTh4mvJSZ4HXNica+p7+Z+5vaLZ1kzICpIa0Tfg3LZ9QJgYZW5Qs
	6gSFwBNp6mGNr4xz/Crby33FnGp0aQeZjXm9eDS+VwBLDoERP3kIiVx/xUdgT1eGAdA10HURI/K
	ssmd8PGUyYqg0L6WdyR3eRnzD3iCn0QP3YrImKY53cKicPkQsEN5BCLXzjtpAVHd26KP9K9tXGq
	ypRd/4QMo2I04cVVz2GJlq9XbpmLPPtt7/nR9HNbWTSpdt2kreITu0lOGKOiktjvefaCB47Z97q
	7szozw9pJa4WQOHpOQ0YbRmBUhqvFtUWt3kknBlSgF38hRoAocIIT91Yc/t/ZQVutXbVtDPk0KS
	thzjr1CvmxAz8sqoMHXfO3/+wZIlY0kwDRUM7D7oe3LZUZLsn/NI5T/KY1iB5lSy8DqXQjTZjtI
	RYvg
X-Received: by 2002:a05:6402:3d9:b0:6b4:2b7:69aa with SMTP id 4fb4d7f45d1cf-6b442ff3197mr7230849a12.34.1793102638778;
        Tue, 27 Oct 2026 05:03:58 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:03:58 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v3 0/5] media: atomisp: remove the circbuf library
Date: Tue, 27 Oct 2026 12:03:35 +0000
Message-ID: <20261027120341.2305533-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo, and for reviewing the previous versions.

While looking into it, I found that the circbuf API is only used by
the local queue path, and ia_css_queue_local_init() has no callers,
so as far as I can tell that path is unused. The remote queues only
need the descriptor and element layout shared with the SP firmware
and a few small helpers.

So this series first moves the remote queue handling into helpers,
then removes the unused local path together with the queue type that
no longer seems to serve a purpose, moves the few remaining pieces
into ia_css_queue_comm.h and drops base/circbuf/. I may well be
missing something, so please let me know if a different approach
would be better and I will rework it.

checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
which patch 5 deletes, and MAINTAINERS has no entries for the removed
files.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v3:
- New patch 2: move the remote branches into helpers first, so that
  patch 3 mostly removes code, as Andy suggested
- Generate the patches with --histogram, as Andy suggested
- Patch 1: add Andy's Reviewed-by, thanks!

Changes in v2 (patch numbers as in v2):
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested. I tried to describe in the
  commit message how the queue handles are initialized and why
  struct ia_css_queue looks host-only, so that its size change on
  64-bit should not matter. Corrections are very welcome.
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by, thanks!

v2: https://lore.kernel.org/all/20261014111213.1967452-1-vladurares@gmail.com/
v1: https://lore.kernel.org/all/20261012230754.1914517-1-vladurares@gmail.com/

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (5):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: move remote queue handling into helpers
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 -----------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 ---------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 369 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 248 insertions(+), 1185 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0


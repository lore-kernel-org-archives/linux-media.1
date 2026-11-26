Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.0
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728620;
	b=0sXnDT1UJlXKziBATdQaAgN8n2IkN6vux+cPli6e2vJ6c+3WfmrPeDEZiXDl2B8sjHC2
	 yCsC5P80DjWJwBksDgHMJXTbDSe8Q0gPA6Uu3WB0nnY/AQZI/jbBuGP0pE9FBFRS0+h4k
	 HWI/5ksBJccmcVYGD/SqTB5WN+fTG0V7aVFR7uUr91IO75tYIVDrVgwWO7sQFnoaFFPAY
	 2y3MS1PD0ZbrQAEptjanu3vqhTyLIUBYYC+MG4PkH93zjbn8MHSiCNZC5dVwxA5Jy2pta
	 6VVqTlQawPyQsr8OaQpnywbufsiFDlYUmGEPB80qSGn/XKqg8dvKH7MoyghvFqI3sgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
	b=mCRK/VXuwhLyBjFP1iVjz5CqUJHbiVe4I3ZQUphQVhygxc5Q1YS+qUie3vmmkNHm8sIE
	 JMpNYWUnaMB6d9I4AS4os79lPAHPZcnGV+aTKYlcUWBBPPHtNBd7WNwcFS36YqjzxdC6x
	 GlwFkyaEl51ZErpgL+euqZpYKaq09GjXK/U6MoxITbdopp3hbJf5KbE0DfOH0jsV8Axq9
	 1xneOpLnCEZJ96yA0fvYkabCoJtsuasoJea7MYEl80wHzHQM50pGcXjDf7JYK5K7pGDhs
	 ywdQCGqNAuIPtYRdBTf8Iwg+9h5xJHb5hOK94H2g/Lg4YgVoh2NbUc5I2PyucWYtkWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBisZxHH;
	arc=none smtp.remote-ip=74.125.229.0
Received: from mail-dy2-f0.google.com (mail-dy2-f0.google.com [74.125.229.0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8A606A321
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB8A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBisZxHH
Received: by mail-dy2-f0.google.com with SMTP id 5a478bee46e88-3117f9b9e64so743247eec.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728618; x=1796333418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
        b=rBisZxHHB05JDLE+7PoXSxuYALG/9iHUO6C/p/+sPT5zq+ULF64KAiBafYa02atIIi
         braoxd2zOkGmFUcUOMsC99KRLXL76FjTtOpgYmi3aMsps6WqaFVB7UKPaX/qGPTgjdFI
         BnQ0corxtMGU7WHBw5JBaB3K0wI+VN5XP4OGuG8ig4njmETAHoALabORMoXKW6SuNqIQ
         5u1jtNLvh2Pl3nnKNcvZ2zS+BysbFDy40KUbvN5Lx3JLbQcnTyVd3cAS/F3FVkl72ZEq
         kGuNYG9qY109JfKZWB9pCVBTgFjOc3W/m9WZJbyEuxikMueSZZxZHqawBOTe6HoZH3tv
         zOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728618; x=1796333418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
        b=HwdA+JhK5q6ciAgXyENnaT/o83DxM/XCjJQWAaS6njlQnqKEBHxBecGoGZmwJEeyx4
         Fd9FvdrvmtVizSc+ICvVPUdeF4Q99ZLVaRB5kXEe3IsywpE+iMTvKC2ugQ1GQiwsGDj+
         AibMkZaQRBMxCqUrMv7Ck80YuZcr4CQ94CxyeSVLz7eVAbqqMUyCbOntU/3dLZE6qUFE
         RuBN31uY9+PtKWKeH1g/2cLfLyfVWHYSK5dswOdz3IPBePYKMjg5I1HkDwSJSodAfp3y
         BbxergnGHhh4VrtgEyDmK5+BOrm31raM8OKbrxpdCAGakieJ3o392G+/IVMgvl0EJkFZ
         1xWw==
X-Forwarded-Encrypted: i=1; AL+hErFwiqWP5X8o1it2+xIRYWnsa8UbvNuK2wVr85XG9UAFpPPrGI+3NcqRGkQiwkxbCLxx01mAYj8lu53/0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8mCqip3l7bA7INZh+/WKxlc6o6qWnmQErItfro1wOjzekXt/M
	mmL8ZWzWBxnc6UV2sdbF7f3auaWiE+V7PbidB0zLR9UT2Te+r6dm6tpX
X-Gm-Gg: AZFdTZdNT5mIAjBg7xNZk8GgWKyWgZVWcdUtm16Oth3udalSCN53OUDdxVMuNNvUDoA
	JanyFCdS/Ey9/tEYvR0clyxxO+3RZwefEpnXEByrRjEzqhN3jhOFRCHlkapTZbdy/RbyolDSvJ2
	uPIZsRgLXuM7+5P7tHfz/rUtMzS2zK01IpBiGYvJ3NdAHOzuMcXTvHGcKI3+UPgx1XJKDG+/Fqb
	CeGhYSvuijv313jXKb0n01aR5Et6+ckjABB17MIygOxJd2/sYdmekL15aApj/UX5v6Oi4WfGxqX
	efwgy2cHToqjsqlRVNfqMPPu95EY5288r8LFBdG20ymXcHxCxuktbXD57K9lwVpIi5nLLIE8b7u
	vu8s3eSVn8WauBfQ5W/qy3dGfqOjC3X2J48x8uToAg0dWgh6TkSpW1cOzWr2s8rK4WPVXbfFgbU
	OpAxc+rKsOX4DRA/8G42ifXqC03vxTDoGtGuJ6TCSYx3PVDFPF59vbifpm2bJ3X1vJSiV7ruegr
	c6+zf4JO13DQFs9OG2248BkMmOpmgnNKgXO75iYoBE43vrm5nwXXcTdaN6bg34a2X8T69cXYyDB
	JY2zhbT9F5rYvB5ZGwrCQXG/kAK3k7F9J7QUWOxVULhEWQRWSyLMTvZzODGLmWXtH09d0wj9qV2
	hr8L6RLlw585RWanoaHwcwMfrz1zEB7Q93vxctQQe
X-Received: by 2002:a05:7301:fd07:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-38570844f7cmr22309381eec.11.1795728617417;
        Thu, 26 Nov 2026 13:30:17 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:17 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 0/3] media: iris: add missing packet size checks
Date: Thu, 26 Nov 2026 21:29:01 +0000
Message-ID: <20261126212904.27207-1-dennylin0707@gmail.com>
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
Content-Transfer-Encoding: 8bit

venus got two fixes in May 2025 for packets that the firmware sends
through the shared queues:

  49befc830daa ("media: venus: Add a check for packet size after reading from shared memory")
  06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")

The iris gen1 code has the same logic and has neither of them.

Patch 1 rejects a packet size that is smaller than the size field itself.
Patch 2 makes sure that the size field of a packet did not change while
the packet was copied out of the shared queue. Patch 3 uses that size to
bound the walk over the properties of a sequence change event.

Changes in v2:
- Add patch 1. A packet size of 1 to 3 was accepted, so the check in
  patch 2 could compare bytes that were not copied (Konrad)
- Link to v1: https://lore.kernel.org/r/20261117204946.21359-1-dennylin0707@gmail.com

Hungyu Lin (3):
  media: iris: reject packets that are smaller than the size field
  media: iris: check the packet size after reading from shared memory
  media: iris: fix out-of-bounds read in gen1 sequence change event

 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_hfi_queue.c |  4 +-
 2 files changed, 57 insertions(+), 20 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C64D9545
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361721; cv=pass; b=lHJCXf3k+5r8f3N068UQnI0H0vH5tJKarSslzroe5T0llMdjqfMGo1zlJYm/v3ug5wZ9fzSu2e56Y1QC7eKGotLmXCp4nyax5kSH03JWVhL8ol0RqWs2uRbr37CQpoRt95ODYP8QVxUfxzFia/A52CDgpQfDSKNLFGnIQNOx9A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361721; c=relaxed/simple;
	bh=jS49fELDwpiqild1Uoy3Hgh8ZGEHWDa35yUd9f04Zzg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DpjqgYengVOVHURqjYnmTxqg3JDsAVbtT3JTdMdJzqaNhEakqcdgHbZ/DAz2+CWZlBPiQ9wJt3bbB/KCUzIh0i5Gjufq2+yvDl4ln9iRRszUyIfWjfx1nsHWUP8GF1PG+5ZA5ciHblc0rgHgaOQs7uviDbJgoFu24A3mXzfAckM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3MAypkI; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3MAypkI"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe7so179212566b.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361719; cv=none;
        d=google.com; s=arc-20260327;
        b=gXJHwbr1/rAUJH/awMP4dAsbMxz6a5vrAnLCD0q5vQ9BZO80wNbVi4nomkBpU/R1Pc
         fPWhcUNvS6nOiBHgGTGWbaqsz5vYTayQwG9FwRDJAzP87rlaej16P3nmxpWOsj3SXLj1
         X855Lmv9zwmDh7D7oPHr7ee6B8LjA7nFcTV4ACkrVeYZNBfP8PG7c8kN1TD83an1s1wL
         tXT7R0TPSUqQkIMYcxuU5em3sayogMNIVsmODfT0uE9cTyFJpQbHXyoOdGEn7ouHxZWb
         vJpPbFeEuH0R9f/Vt+gesCvWg+Npc9K51NpEp3U66TZHYwyyK6cgnrnE++HXjGbn6w3g
         xtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        fh=aWYIW/Uo4GUVO7vhKB8IXSBZLKw+WHGZl7rU1qiOf5s=;
        b=SgtcOg5lFPjCswo+fyXFC7S/lmCAAmntImrce2+D175nQGdF4yL/P0LehEQXzB4NOO
         q11V8f1daxXJxbJCpYmIWCzFOu37X84ViGE6ag0qg508zFKUO78cwVPZThfLRkLrpwEj
         vcvi9I7RT1iUBtVe5No3S4nfafAb7VJaoe9/e3mH2TnPpGvIb4u7Qj60EDN4MVyd/t6o
         rflFhBBymEuE990NTDse9vwijDFvZh03PN80T9NTft3biRGsHa+7XjijW1Z+hIhkATcR
         OOz7I9chCYGs6pJlJmbvLuOhjR8mQIiB27uz0mkEBf8MCUL1I7tbOR0I54dYO9nz3OCn
         Cn4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361719; x=1790966519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        b=f3MAypkIeORLrA/NGmAnODOdbdy4xBiWY/idwSv8/FIPJLj2jjGHOmG4CfQaDizbdi
         qM3LJ/dWB2FalFhpFSguZVI+4zVaqPDSprhBmNA8XNLE9xxCxXEhmlFDlve1rdF4oRqU
         Ltl6DJqXBXi7KvmNQJYsG3YjtFEl1SIqTY6iXv3sPRh4tUtETHmnTJJ1ES/VANvUgQ0v
         WXvapdGJwxv5NpZaqMevMSCWcq865p5q5qIW0xH8pSLrRcT/obarz43s4rph//74rqIV
         /0BsEOvlaqpJNMBxzV6EWNu2LfTpauRw8ValL8mZJdRqaQLtFPx3IUFHj3YFcdsuX2tF
         W19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361719; x=1790966519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        b=h7uslTWUPPWjsJEoRziOuZe7DVdbxq1t7AzX/oP1C7ASruGooUdSiihXlf1PkxWKuf
         iut1W3vMbxIlnhh7NQUI8f8ATeMs+qHxSqx+LfmjQwXNZHGZTwbw/GpO4VyoDUb52HbH
         uU/1H8igwvBJMyRkn/B7nIgry+8x1bvYfhgJAli9iaFzDRTyaR5XVw0cQQar5NNHcjn4
         j/+UoKX5z7KULAp0+TN/85YRHdR/SSNRCIJNITfoISH0IPNV2uHIRfypMAGIoS1ipqFs
         XSMkm4a4akCK407DHIPDF8Q1vva0PernRFqbIc9mC3ggIO192HreQx4edK2Th21eVQm7
         ZEiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0pCnm5ZchrF5LzscFdOj83Rqfb7dtPz8zPJ3oLIpB7xkSlACuvjgE+KiVDlw7+yOg/xwvTmFlRJQ5rw==@vger.kernel.org
X-Gm-Message-State: AFuF++kdSWoAA5j4P8jf5F8WPbpqJrhSCLuJQfK9Iwr2jZa6f/o2ZI63
	8p4bx4VcdbirKL9Uiqe0lPx9jYpK4qCM8ukberE+v8GIxodtrl1ILZUw3DwbJpa4f75M5U0kg51
	A+7OuZ2HJbXmo/zX6Uok8mPenul3cZA==
X-Gm-Gg: AYBFou1G1PgopoVInusIrnfV8XmwE/4YqcUBNF6wPh0pBCRTLpLemG02K/xaeGb9YdJ
	5+QqcIlBh8//kTe2RggYReegK31gsIpwq11SXX6Ag6AxN2SqC7srYbTbm+rexDC6lMl/96v0F57
	rPKGEswqHO2POu7ifCpbbIwgD3PMCdMmuBBxf+wgtJRtqDozrSGk3pqUiETd4UmI3RCC0XcbEdd
	DnSBvbgwsYpfYLtxxyCW3uGkxx+05rKtPe7a+hYjWrkizl1Itj0Wep2BtXo0jXQA0Ddh1KyIvJa
	Cyj4ZmwzqR9ci5OuGXbiffsjGTgszaBEuZFtT164zkGMCztfh9mMQp0eE14QDeu+Gw/83BwfZim
	cKM8qy2uEeID9SnOlufTL49PEfdyWMdCPE/F/fugNNp2RGwGUCXrqEyXhXomb4yCt
X-Received: by 2002:a17:907:6091:b0:c16:4df6:176b with SMTP id
 a640c23a62f3a-c2ac23d6040mr610229666b.20.1790361718505; Fri, 25 Sep 2026
 11:41:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:56 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:37 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 18:41:56 +0000
X-Gm-Features: AclHuK-WuMP610jmp01dFKCpj0Udiol-MQxcrP9tYdnANDZk5EBVQKfElIsBHyg
Message-ID: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Subject: [PATCH v2 0/2] media: venus: fix HFI teardown races
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v2:
- Resend the same changes using git format-patch and git send-email so each
  diff --git header stays on one line. The v1 mail transport wrapped those
  headers and prevented git am from parsing the patches.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0

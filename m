Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286692;
	b=gJpWIBf0VQVqsYDd+KILZDK3WFzs9enlpw7XUL5JVdD4qDo6oIKP4Pk9pYeKw5y3Z6gN
	 hXV6C/jeVCmZyPvEfRnX6KtCJqDp16pCeY7htyjKKCfHtWkR9eLZX8JVyurhHYCwlKt1Z
	 OjYZDXTBHvbAS5YKPfvog0FXwYFosrPtIEDhKltSsxyZ1r/yWMM1xbWCVrHvXRLLs3Sr6
	 Iz7zzkNrDIWp/LuWU7JSSoT89zLWf2R3j6rUq1SdHgHh1poDVjRnIZa5pWRPOl7+sYLmq
	 KkvxYAnaBEKiNnWUENp6npAnCk4SjpvJ+o7CfbqTd8scbWN5pnU73yfTTbjk7yIQfEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
	b=nzsxx8vLSIkAE6mga8QQQH/n9lZ508bXBfMaVtSyAE5AluxCshTbAWzhYhu6jDdvwwYP
	 GL1SKyJF9iBeyB0d7SAt/9PUdAeO4IFCaZhtA63kAcNHudhHo3uZAywPtdma8lCI/Ng0N
	 VMl/s0iwhdXYFvqvIvJCVgVRKu0Q1+4e0pQVIH9yCvvADATuEnnxG0V37htb4c0rOAEOz
	 QDUhpTKqj7uK9RMn2vLgCQjHYEXxTuDaBUHaAfhVh/WL+YqeOb8k9eNzGfvztO05tXgdo
	 oIETsTDLm11dYVzPxl2aWEfjvSKr80rHiXMfIlCoYGZQCTRa4ly7F0zA388IDRbi5Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQqqYSWa;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A436606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 04:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A436606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQqqYSWa
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ea0c05c92so16322686d6.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 20:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286691; x=1794891491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=KQqqYSWanyzanYGMVvJoVq1Q3OSyiciInnp7CmpNy/ELXu01iX1FI4OYQ05vKpykpM
         fGcaW0bgvO4uXo0J6dnIxdWcxok5LhqgBkaymyXd86g0dKW1lvbG4QDToSVke2u6s5iz
         1nNu4/LYguDDsUXA6J1wnJnrX5Y7VuKYTPv2GHP7bznh9Zwp1kcGo6UJVJ0CMvI57gSQ
         79AhOnexbBi6XgyzS5tS+JACZ8rfTkrk2Bswvu8illsbGIztZDmLfYsqe07HT9ZenwjW
         mtyEpJOHOFNbRVL9ImJCY3eMOFGCAHNvzstmz7ytqElhbL/FMZxvbP2LkpGfA/KzuHTd
         lDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286691; x=1794891491;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=JnzR9R5U9VsS5qpveJhhRrSCAQgY3Oyh+wwkfhWPuGKaVkIUW0nl9UjW/lO44/dYls
         PdOhQ26Y/af4dOdbNFn98cAwQ/ZXLzOiyFuaf0HfHU2v8TkdZbRqwH99DEbiENvspgiG
         OYixjijzGF5o6JlB5DEuLyKdcbUfLP8xSPHoxRtixFKW17w/Y4tA/L4SwAlO29XZ+nIA
         wfoDQJdaZonVU8MOL3fjsTLrsFxs9lHhndDCUr30xQcCKXq3yOwD4V+7XXXazJCaYkFR
         D3DMY1Kl8/MYV3UowyQP9/j0hZLP0M0+k8JPRIRcjFJh+PicqlRSgCXdqGRmyG01NaWP
         +5Mg==
X-Forwarded-Encrypted: i=1; AL+hErGxyMFnWNkwv78tKPWZJRIbmw9W6yoor77yfETDdmpJGe5dQzMPpfdV7QLDk7VgxdQpmQrzjzz35tEP1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9A5Al/at2/Z8enNZfFE7lnTKcHUYzm+ZL3tF04QTHaWlTQM0a8
	TYXwJ/SKBN4or4tQ4PtzNoyQfq/Tv0nxGsAMt2VfPif9g25TFas8Jfo=
X-Gm-Gg: AYBFou0wrCJqt3WRYdUS+BFLY/MCIWLTRupWtvjIRm220uclupmJj7GZVHW34Em+vYi
	LXduH6Kiy+bq3BCBRHz54jQIeFR9id11hRp3yQaldJEbWSzTsnmOVV8fHTbMXex+oyTDhA9pGfw
	s3OP5OV0+aYKytfwaSwTHGNdP+puCG0CadMgwAfdtv97lPpCfrk6TdMSWGi9PeDBsdgbWMW9Kh7
	vBKhTHi8Ln8VKjiEQ1GM7EgkQa++QVViT2Ik36kymPZjPxGLdP9gVCwtpr3KA42/l8OYWVuJYdY
	ZQVbdyjoZlSyE2YXpcge4NRJNjb8m6smU1jAPgD5uulCouCRN3qPRrvGbWsZOod7lxCevDXU0cI
	TbSosXgJLVy4lkzUszSBjrbk8dlBMC2YZmU2252utyRsa1fCMUVYK9pdr0cXCTr0kFL8IpUkhxt
	86mbeQ7HPWrVJc0FlxZoWnRn00+wdYjwAf47pFeL3lv8ZqOtCTRXVIhm/JW2GHPudDtFwa0Kdaa
	J6DIkxc2nN4FvDF5LDJnA1IH7hgxnrMxsaMrtqXsQXb/3m7x3vY0jrvzZ4OHeeva5h2HDAqKqge
	yzj9OB7hy6/PJEOWKMCJ29q/GkRkLWPXz8XqbFefRtoMLXytjVuvIiCgRxgebgKFPgvz+W8p9ld
	xUq12/TJw20gatSrqyfSSE+N5FVTcB/CIqBBoRxGRVV3OakLMtAf5asNkwrj5/Tg1
X-Received: by 2002:a0c:e018:0:b0:91e:c6ec:1d9f with SMTP id 6a1803df08f44-91eef9a214emr27070326d6.52.1794286691211;
        Mon, 09 Nov 2026 20:58:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:10 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 0/2] media: aspeed: order probe cleanup and last close
Date: Mon,  9 Nov 2026 23:58:07 -0500
Message-ID: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
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

This revision requests the IRQ after its dependencies and synchronizes
IRQ/work before manual probe cleanup. The second patch fixes last-close
ordering and keeps the engine available until VB2 release completes.

Compile-tested on ARM64 with LLVM, W=1.
No hardware testing.

Changes in v2:
- Rebase onto managed reserved-memory initialization.
- Remove the research sentence and Assisted-by tag.
- Join the IRQ and delayed work before manual probe-failure cleanup.
- Keep VB2 release before normal last-close hardware shutdown.
- Drain the IRQ producer before cancelling resolution work.
- Balance IRQ disable/enable within stop and check STOPPED before power-on.

Myeonghun Pak (2):
  media: aspeed: join IRQ and work before probe cleanup
  media: aspeed: drain IRQ work before stopping the engine

 drivers/media/platform/aspeed/aspeed-video.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

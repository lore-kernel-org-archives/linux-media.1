Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA3F17A31E;
	Thu, 23 Jul 2026 00:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784767618; cv=none; b=Lkx+nawOz1LvztSUwx+iJjSzLogV4SssUNHGu+VTWHhOpCGVtvmntvOurXFLBGtjLIHb/dNhCd4OWzxvsxuffd/S6VcBwSgJ+n/8Gw4op8HTqFF5Un31z7XrZ9UYM/R6+inmOBlETJsHwRklxvG6uNSJRGSpWeU94N687RAsWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784767618; c=relaxed/simple;
	bh=OJHKUYMFKaoMIxRVzHh5k7kdywBvMNCAGk+h8PoY7yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SnD0QJiRasIdFtxfg9ahnsAk0M4ZUhAyTxUof8/L0YK9FiyI+Y06B4rBAPOY0a/OjIGahdKZH3yE+V8505L+mwOTZE6lORgcuaqlHtwqEA0m6QFKTfN9pqVAWUI5dPJlJo9QJUmfbnsETetQjYnkitE+jagSLQa7AI+tEn45Q1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=lqS8Zdsv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E+QVGlWg; arc=none smtp.client-ip=202.12.124.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="lqS8Zdsv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E+QVGlWg"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id B17A2130030A;
	Wed, 22 Jul 2026 20:46:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 20:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784767615; x=
	1784771215; bh=OJHKUYMFKaoMIxRVzHh5k7kdywBvMNCAGk+h8PoY7yc=; b=l
	qS8ZdsvHfjDg2wvyG+Ep/sVaJebLS7C5PlXP+Q2i0DKw1qJxmgkJ8UuPSlnMir3g
	hhUGiLVEgw+AsQHDDi9U28Gf0W5tqySHP3AqfBB0Bn1dSOr0aCn30SLRA+eUqGyM
	8dP3Afb7v/v93wfQ0SkJXUKQtRbMGaAJ101MZu9pwMq5nLlaA3pinTgShBYPiYzz
	RU7Ws/bnGklaBPmrQHs8/lr5TXLmJudGbD4Um1mHjLtbeIobXgDEqOgmmtfoj+lp
	ujCUaZWuJS06D4ht2ZuAm5h938Z22pUpC92vBE1WAEe1kPBak28qH9oF4Giomul4
	RLkhDZvuo+qp/kThAQhzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784767615; x=1784771215; bh=O
	JHKUYMFKaoMIxRVzHh5k7kdywBvMNCAGk+h8PoY7yc=; b=E+QVGlWgS2Vm5PeOE
	wcpyw+ILTgsCfRB8LdWIEq2yFlMBhiC+B0LwVDRqxhrAbPmDuaODB5eHNx7yVx85
	O0cDAXDxf9U7G/MpUb6NMjqOCFAKiINRI3LVmeqUf2qRjTadKsfryRTKQQE5AcPZ
	lTUVI6ZFph7LGLY+C4qRDN44LTHBRKy0cAEZ6nl8T1CocL1BcwaHpM6WrjTqdRi4
	PTm7286LwQgRtrfNjr+NBOyz+qNghUUf4tqqgMAxChV0pAbRyVU337YbAIPIQfpB
	bI5L95PuH1ymptQ24vYrpfPFP9fneUCv7IwYvJQ7IA8BDva5VzYoS9EXkx0qVTjH
	pKPjw==
X-ME-Sender: <xms:f2RhavNAZu00QFN0kLfWDtBOwMLBnbNn7cyezesFnBglAxpNFNf6kQ>
    <xme:f2RhapYdT6i9aWuR_LOUOz7QZPHj5ZrYEIFhdiDKNh0T0cJ3yXhAVUnh4exkWMkSp
    nmuZQ7oxyZb4aigP7iNXXG-FObr7Vq4fBxJPQrCHeJe1rvRvJ3r_gg>
X-ME-Received: <xmr:f2RhavVht6xTFW_3UB3sDP1NcG7ZWF3IUvuCVcvgxL-L0NIydy-eRnm0SirmmzkBAfbo2XDaEklIk5gscvmFKck4NfAYVzN0Hdq9Z0rlYbGc>
X-ME-Proxy-Cause: dmFkZTEokqfq+D3jpgPBuTiBa0dJJRdul8tMci1cvXMe3NbvnPtDgyeMlSfDNY2VQZCYm2
    LXht2BNYdL8iUtCGHSZhcwG7q/Kwl3zIUaoC3BGOdInsGrs3nFYGV0l20ZTGRKX33xkdxH
    NrkbmddZ2CiaNePh2o3WZ/+U94U7XFDTfdNEN9WbkyGOyRxMeS4dRBw6ne/XhrYOCTO3Jl
    ClCrSi9gz0eIQPQAjjkl3Sb4QSzuiMuP32yq/tuzWd8kGBQfEHsoAml+J1LR2BOOYVtNmX
    Rs6na04Rv82XA/POUiW/BzcYn+UppGRk2cBhE7PHgbgeUCkSX0KVVP3s4tZcULINdIF0tY
    +eQ/XxpkNyngyjE20TnzMlQSgfnmZAsk4QO4SUKbHdtLgwmnDzvZMr89cLT+YAQlPLD8kS
    HQVwsOjoN6yIJS5W304CtQIY7BaKdW4qVsOlS4nAt5IX7bCfaAn7WAXpCd6ffY4G9D65v3
    nwnIDTNwlUMBM6CuBv4cKSpF2ZQZafXm/Nx2oGwLZnZKlULKUf7/XJ2NjHpaL9F2Jo66Ih
    QdREgIHQ6LOsNQLAZgFnecJztYOxUo7sX1tIRFtjMJpPsu1YU5mr7/dWYU4HyRF1xfU0Jo
    sNImIILq/J0mefNqxkxyFzL5JQ4O2a9ibKnqCiOKT330qChgE6JzmSPn5kmg
X-ME-Proxy: <xmx:f2RhaoBGnUNe0OzkAL9F4YZcdVP-gTXibNIx88zoEyfctr8ues4L-g>
    <xmx:f2RharJ0MXZglop8uPFkV2YEPJF0suvzDuDi6YoOM_1kWdke7YS2cA>
    <xmx:f2RhamtrkAiEubMyvmFs98MHBE-H_gQacrbRlRpkGmNSHuWCmNRVqQ>
    <xmx:f2RhajXpTlEUBhTfzZXCDc0fO5IKWCqRXGeOqRy2ZSj3j5ZRCpJTKw>
    <xmx:f2RhatQrWXI1KlMxZrJ5bfuWMOaSqZuupZls3oGhvNT5ZuGxRb7rj-w4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 20:46:49 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: nicolas.dufresne@collabora.com,
	detlev.casanova@collabora.com
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Date: Thu, 23 Jul 2026 12:46:42 +1200
Message-ID: <20260723004642.2075233-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com> <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Jul 2026 20:29:53 +0200, Nicolas Dufresne wrote:
> This is really nice to see interest in enabling encoder for this chips
> set. I'm adding Detlev in CC here, as he's actively working on RK3588
> encoder, which is quite a similar chip.

Thanks, and thanks for looping Detlev in.

> So Detlev driver, which finally got P-Frames support few days ago
> (he'll explain why this didn't work initially for him) [...]

This is the most useful sentence in the thread for me. RK3576's VEPU510
and RK3588's VEPU580 are the same VEPU5xx family -- same vendor HAL flow,
identical reconstruction/reference-read (recn_refr) path -- and that
reference read is exactly where every P-frame stalls for me: the first
inter frame of a session hangs the encoder watchdog fetching the previous
frame's reconstruction, even though the reconstruction is valid and my
register writes match the vendor byte for byte. So whatever Detlev hit is
very likely the same bug.

Detlev -- whatever you can share about why P-frames didn't work at first
would help me enormously.

> While this isn't invalid [...] the community agreed direction was to
> introduce V4L2 Stateless Encoder specification [...]
> [...] we decided to look into making drivers similar to how we do GPU
> drivers today. This is possible today thanks to the Vulkan Video
> standard.

I'm not attached to the stateful interface -- I used it to get something
running on real silicon, not out of conviction. Before I commit to
reworking, I'd like to be sure I understand what "converge" means here,
because I see two fairly different directions in the thread: Paul's V4L2
stateless H.264 encoder (kernel-side reflist/rbsp/RC core), and the
Vulkan-Video split you describe for Detlev (thin kernel module + Mesa
userspace). Those differ a lot in kind and in effort. Which is the
intended target for the Rockchip encoders, or is that still open? Is
there a branch, early code or spec draft I should read beyond Paul's
series?

Either way the RK3576 hardware enablement and the reference-read fix are
shared with RK3588, so I'd much rather contribute the VEPU510 side to a
common base than maintain a parallel one -- I'd just like to know which
base that is before rebuilding on it.

Thanks,
Jiaxing

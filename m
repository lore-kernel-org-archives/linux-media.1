Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795307916;
	b=pVkghrPEdcGTjoJUXyUGsN2CY1lgIQDwbcdRW1sswDSzlIURp6UUZIxP0FBDOT6LiPFe
	 SQmuHAc1aU9iR/ynj2RHB8uIMC6FmpQGVpQDNQfKHE7qMDnwuRuxIqs3Wdrekng7uGBGH
	 Fo7DHbO2zndg7kr5DUX5PF9xDKGc6Le2535ux7/UYFY6pLwp/kJn9ngkuW9DJlXTCN/x6
	 1iuPyCi6vqfL4jKvnKAjv1/ZOPqhf+u2VuUIn/Bja6kmhbz5SUui5hzBe+0knAiDJFw4/
	 OcX9nZOBiZmA4Q8C6tx+eeD3mvT02DrG1Z8rM7IOEtbteloVrDe61uWClRqi52hiAlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307916;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7721dtXy+uOqmJAcrPmJ693zdXv7T0kbGWyN960JshA=;
	b=D9SqAVTx1/WGxQfA8soGAlUhBPTkHhuWvKMkYHBO6TwBRV+N61eUeHRjgXszb3GQscbn
	 C/w6bKxWe5HgswVQ8vcb5SXwelBFb3o6tUJEzV+VaSVUBSv7wN9XxqvcNd4ckOnAB3UQU
	 kzrqC3zUhI5r1ypqSRDj7TK0sBYdiqywlOBOZR4yBuU5yPcK06igLoSMtVGl0b9bSy6+9
	 aIbEdvwLlZPF7u0qtKRB4pGx6nuDO0c21aTBc/GVPUTzwNZeAv/cXYONXN5MHp+IOwXIE
	 S1tTV59sylPnReY2qIAYwNjaW/sbytSOPQtsyVxZQ5Nf2J/+qJQIqjBlMkX0YJU9jxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b="dmKjF/nD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7D606A320;
	Sun, 22 Nov 2026 00:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E7D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=dmKjF/nD
ARC-Seal: i=1; a=rsa-sha256; t=1795307882; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Xoz6J5k4tYYUi4YEY7jetL/jIJpIPUyROt2bfpoTFCS9sHBL6QgWu5a9yQOkL/XHr562updjmfBm1N9TCESXzJqsg7EQmWt3LcP7M0X67GK0UMuutS7lDXGSD2ob+e6DcBLcw6UHu+m8/UxE0uYu50ZxcejRgISnesx4XvSEbGM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795307882; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7721dtXy+uOqmJAcrPmJ693zdXv7T0kbGWyN960JshA=; 
	b=FwkTp0kAI2KTbRyjxVjzfyRa1lMVN1/8wLq0erCfrW+FtrMyS3BOpq4fI+dtem85XXrkJ4WjQvXOY+ouKeVbUpjNWqlPh+6zcowZ1h/8XqGaV8QNYzGrDpMQWQgKp+0oS/tPBuKkBhIpMJ14NJDfmslAaIWE115U7WrbtwU1Q4Y=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=dmKjF/nDHJcEIgJiWQ/QomA2hvEKtXqknP/ruqOOpPo4gLbj2aowB+nYXtGKNFna/+Uat5XIpANWJRzAahk5ZDLtE3qTITqcnpmkqQf029Vn144CE5E/V1CM42SNVPDoZeWQNYCWmCdDI+jppZJkP6EZLFjHthzqeJdiUMQph08=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=7721dtXy+uOqmJAcrPmJ693zdXv7T0kbGWyN960JshA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795307880165583.4787051402167;
	Sun, 22 Nov 2026 01:38:00 +0100 (CET)
Date: Sun, 22 Nov 2026 02:37:58 +0200
From: Igor Velkov <iav@iav.lv>
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Igor Paunovic <royalnet026@gmail.com>,
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: rkvdec: Add VP9 support for VDPU381 variant
Message-ID: <20261122-rkvdec-vp9-vdpu381-regs-1@iav.lv>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-3-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-3-180fb2d1f10c@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Sun, Jul 26, 2026 at 03:25:36PM -0500, Venkata Atchuta Bheemeswara
Sarma Darbha wrote:
> +		for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++)
> +			regs->vp9_param.reg94.vp9_ref_deltas_lastframe |=
> +				(lf->ref_deltas[i] & 0x7f) << (7 * i);
> +
> +		for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++)
> +			regs->vp9_param.reg75.vp9_mode_deltas_lastframe |=
> +				(lf->mode_deltas[i] & 0x7f) << (7 * i);

vp9_ctx->regs is allocated once in rkvdec_vp9_start() and
config_registers() does not clear it, so these two fields accumulate
the deltas of all previous inter frames: a stream that changes the loop
filter deltas gets the OR of the old and the new values.

The same goes for config_seg_registers(): the *_en bits and their values
are only written while the feature is enabled, so they stay set when a
later frame disables it. rkvdec-vp9.c has the same code there.

The VDPU381 H.264 and HEVC backends start config_registers() with
memset(regs, 0, sizeof(*regs)); the same here would cover both.

Found by reading the code; I have no RK3588 board to show it on a
stream.

Igor

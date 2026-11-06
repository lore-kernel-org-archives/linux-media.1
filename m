Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952000;
	b=N3x/WgP8qxhGodz7rDY3wvO8CntUMkdzYNzjPuOVEYOCiogmHNkWDS88DS9GDMHDiXAE
	 KZTKSh+ZzAkYNGfbawQ6HPHPT+UBWPT15CfIJkipHfnnBRcSEt68XAotx57YUEtP/lZ//
	 1+XkzSTIm2VHH5cMJ1fnPpcT9AXtWEOpVE+rBOSHFN8SL750JaNOrr4bgqeMHfNqTX3/9
	 OshFShZnqHQr1JlfaJ40IYdnPDj0VpD0Zlq5cKzSeY1Uek5K/38XgrywOdYuVsGLBlLE9
	 jDSaa4yWIN/IcmtVYGEo8XW9/5jbD4L7TaD7KiP3ipiBGqdq1Dky9atty3BuRo5BKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952000;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=v1nxiWNvDsl1hp8WE7cbHLaFPIl8xhWiB32WOkhgz2s=;
	b=JJPVMTBfmPbxgQWt5n0ibb05q1qg+xO9JMm3yTKN41m1HF215ekMlUm4QE04VK4uWCW7
	 EjF2J7sN8JBivHjBYSgNY383N7QdvzMy28PUSGxAXQfRwtToM+2DQS0Jn0R3ZwrOZT21a
	 TPnNgQc5pXsUgeABkv1f/T34xbhwQBAdw5GCyTu0SaEsVPBKmHH80Fz5JqAHmb6ukYUR7
	 6co/j8P+7x8ItHvlAxyD/BCwM9Btkq9LBnaYY0CJ4FiFboskEXw+H139IMjM7uS+15vU+
	 oi2F0y033jTfko76GvZoY1auyVNvnOMzgPN1LtWYvGY7SJ1F+K0Eyz4SR3Ra5qowy0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=otwkvtkc;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4BE608360B
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4BE608360B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=otwkvtkc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793951996; x=1794211196;
	bh=v1nxiWNvDsl1hp8WE7cbHLaFPIl8xhWiB32WOkhgz2s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=otwkvtkc3DlziLQew+IU4qO6/zBfJ5/S496aHJXavnVC+iRHIsr9Hr8BHpdr5LZ/n
	 WjThr3BrslxS6tWdDSEx9oOxLddFwf7bRoBUdM2sSNG2PD34+p4XorI33OD25mzgkd
	 hm11Ol5w1zrLfJxO7aVrmZB5wQ44skz2heMJ7FWJ9O7hfnk0fIDjmOof0C25vSdCZi
	 XNRWsT4u0dR0ZXCJ7PBl9n03GRi8cxmjcL0ZegAKk+u/UOzHU4syg0bg1J1cYf5iml
	 tfzfxP58ee125bmisrLHgLBzxSrG2fQV6bri83nWfl4b04g7+ja9Jlfe39xRZ9qlUL
	 vIKip5VSkwV8w==
Date: Fri, 06 Nov 2026 07:59:49 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Jakob Berg Jespersen <dev@berg.pm>, George Neacsu <geocausa@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, Simon Kruse <simon0x+git@proton.me>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20261106075941.9756-1-lsa.uz@pm.me>
In-Reply-To: <20261016210246.58562-1-lsa.uz@pm.me>
References: <20261016210246.58562-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: eeb78e8150a51e158ec5410fe35eeb13bdaf97dd
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
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Is there anything you would like changed in v4? It applies to v7.4-rc1,
before or after the ov13858 analogue gain v2:
https://lore.kernel.org/all/20261002093507.43584-1-lsa.uz@pm.me/

Both carry an Assisted-by tag, which 7.4-rc1 no longer accepts; please
drop it when applying, or I will resend without it.

Sergey


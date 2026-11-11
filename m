Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391057;
	b=lLKzMXPlwNfrKIQbnMKyHC63NHv259ACZz082SlWCzVVjO+tqNkdmEDYFO1sYgq0014E
	 7a3uvZJVFbZcMaIRDQ1ZbaXO7BtoBfKF4crFNNc9d8LdTbL5zroZWI2zd5C9/q5gPZ/qZ
	 Hl7EkINQ6abhH95PmcaF9EgajzvXxmPquZGRGXJmR8VIc9hpJI51hDHIe3wcoVNT6dWdB
	 ZbVmPWQJV9pd9cjaTGZa8C5B3j+TTU70jXSf4aDWy28esEtUabaLg4lUfSh6Z5z57KAGE
	 NsBZq6zeBYWR/eVeQY+KD3ecx+7E1eD/ZEWC4ZQfb05edJyGSNlFHG+LPiR9BL6wRBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391057;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ee4yHCK8M1GzmysXRLc2uH0TnLVx/VLePg+e+5PvWNE=;
	b=ZSkoDvQlRezN502dcHuhpFPeESj9fONIo5Nwideh7wq+FAdu72/zjc2b1zYAGBTW9mA3
	 /4pJORX+gnw9V76l+bUJJXcfCBl0iO7aA5JWOfHnFwriGQ0pBB44x6LJcFabYe+t/Fbrg
	 YL3KwUl+IWRUx4Y2IlxQ4WxQE4I6jmn5imI8d9UbrGrdkpSlNODgUHxanqmunXB2UUjZ7
	 HbrxBS8qy4Yjktzn0v2vL/D63sXcr3ocpNQuaVZ6Mn+1t+hfY9K7AiR59MAFke0QQkbmr
	 6w7umAGDYMFu3iGSYnycFoi1ILH1fDEFVco0MY2Ul4/Esor6uwDhPcbfeMGVQfNT/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=m4t47nr5;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B6606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F6B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=m4t47nr5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794391054; x=1794650254;
	bh=Ee4yHCK8M1GzmysXRLc2uH0TnLVx/VLePg+e+5PvWNE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m4t47nr5jR+D1TYRq5yR3mAsEtIr/lm1dhRb1f18JZR0Jk+rFtc3VbqfZ7JgkIdad
	 0NT4XaxzqcTrrkmmb0PV0qf5+MSV/i1m8YNSfp3OoEzPOGQBboo2qRT/o7G3TJoAzd
	 HjLDKgfinQKhVwP1yc564mSpa0thYZthpzSTdvjXjn8+cE/7iv4s5pmfj/l+zTNZML
	 YgxDAzX1Np5X6Y2dDneNnuVQ8bqgh570WIjvPFQnAk3gm4GfmIgBUim1g19B1Zp6B5
	 3QWdLKsjpTc2Z+u8yvpFwAestDExvHpCEBWbKhLmh2l1tfEA5pTKUJglKO+m2Rait/
	 VWWta+MkCh/hA==
Date: Wed, 11 Nov 2026 09:57:25 +0000
To: Emfox Zhou <emfox@debian.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261111095717.52181-1-lsa.uz@pm.me>
In-Reply-To: <179438997668.7.9005518768995826598@debian.org>
References: <20261110195454.48176-1-lsa.uz@pm.me> <179438997668.7.9005518768995826598@debian.org>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: cb4bd0c39d0ddfd686146a1d749335718ef79166
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

Hi Emfox,

Thank you for testing on the Surface Pro 8.

Yes, please send the Tested-by for 3/6 and 4/6. v5 will add the
Surface Pro 8 to 6/6 as you tested it, and carry your Tested-by there if
you give it for 6/6 with that entry.

v5 will be on media-committers next, where type 0x10 is now called
INT3472_GPIO_TYPE_AVDD, so 3/6's "vana" entry moves to that name. It
maps the same line on your machine, and I would keep your tag on 3/6
across the rename:
https://lore.kernel.org/all/20261111063351.96951-1-lsa.uz@pm.me/


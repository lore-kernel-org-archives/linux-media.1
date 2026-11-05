Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909133;
	b=YOuqqPeigTlvc2RvPpzQKPcr8uGj3IDFUQJGMpN7igSniYd/i+jOhN6CTKcKtb+x1FjJ
	 mOPy1gHCeJuTRWBh5DjK29mez/GLQypd87A86OGOqhVfdRa5p7oAYtkAKkGl+/XCKP7J2
	 HW/bsHhnHdynl7suxY8U+FkbSmwAZoVHBCaZFdhlxIa1hqvAUssKiZorclPRHFMlLgF3a
	 QDzCFsrQ1AaqXacVXZxQ3GLUvf9bd5MRE5rJzbOtnQKIE5mpPoeASFemBPi6H1VryTnVB
	 oMSTD4fszFODfKJ+facmD5PiaMc2ndThNkjC0I5YxfHBk7ZE9Zcy/eZyBRWshpgawkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909133;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aTkxU8li+gjGMoUJnuExfidrv0CihguNgyumwpUW3zU=;
	b=xmqN4MbBGe3kBqR/TWs/1jl9spGw1nR5fDN9WYH6/2GSsYdejjL3Z8J1MjAYDMIY7cZZ
	 pu3EMsP/8iDz3HMSq61jCYMWS3SIynwPE8ZMvFVkJY8aTwOH4FW/NPVp4iWmDrZ0mUuui
	 y6GSskq8eWpu5UAqkPJu9tIRH2eYy/69fwwNjW0Sfpsis3O03pLgyarFzuJ9vsiP+AfRg
	 3REVwSEzABlfEYlm44R1XD2v0RCWnDYg/1/9p5T5zPTn7TwhPdgmz4E6NLiOFh9I7KTj3
	 vpItpBchj+AxcRVRBc1a1EcZ7SA8HuwH2PL4khAdcvaFwoCETy9UBtPR09lw6QyUGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="DmQ49Rs/";
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A082A606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A082A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=DmQ49Rs/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793909130; x=1794168330;
	bh=aTkxU8li+gjGMoUJnuExfidrv0CihguNgyumwpUW3zU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DmQ49Rs/pFiBP+JjIvwxMVg9p5aeG/NnFsuTFnoWNvyibvqIi49S4izdTYyJ3BjEV
	 biGSnfWtJkITH9119c6KVkjh5ZMza78lmgTWbVP1kftJxx+VXa3KbWV7llSFIPYPtF
	 uR0QZ6yEP5LgtY0+kIcGnVGdJt1QKpljLqt0hO4f1dXmEpGQ9CYIQCYQyLXTmiSQIx
	 WDVruhqGxstKCIAbZanzFV1Km9eVT9/Ard/NVGDsjXtm8C+mWKslxF9pXDLsNbfulK
	 hIwBXXYvor9l8EgfMk48lYU104BOKrcCyjjOEreCRy+b1e4zvt0LIOHZL+j0Ego/MZ
	 yhr5fy084JxtQ==
Date: Thu, 05 Nov 2026 20:05:22 +0000
To: Jizhou Tong <fqwqf@fqwqf.xyz>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g0: register through the sensor helper
Message-ID: <20261105200516.68263-1-lsa.uz@pm.me>
In-Reply-To: <010601a1ad26a461-7000cf48-b14a-45dc-b2bf-7b3fd5d81aef-000000@ap-northeast-1.amazonses.com>
References: <20261103103235.94397-3-lsa.uz@pm.me> <010601a1ad26a461-7000cf48-b14a-45dc-b2bf-7b3fd5d81aef-000000@ap-northeast-1.amazonses.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 92eca1a32871f044103ac3776dbc62a43b11f351
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

Hi Jizhou,

Thanks, you are right, and the Surface Pro 11 needs it too: its INT3472
describes a privacy LED for the IR sensor, and with v2 an IR stream left
it off. With your change on top of the fixes for Sashiko's review, on
7.4-rc1 with KASAN and lockdep on:

- the sensor holds the LED once bound; it is on while streaming and off
  after;
- unbinding releases it, and binding takes it again;
- v4l2-compliance passes 46 of 46.

I will fold it into v3 2/4, with credit in the changelog.

Sergey


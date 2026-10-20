Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486337;
	b=BxPgvdv76ZnhL/nzYBrv8dXdhkY7QAyb/ASEDgnZwwthsCr+lSD1Z/WUm6GUsTMQ9lsq
	 sb9n1zRTc52xj2P0IE4MktLkj37+AcvVTPo4ah+y8xsf673eHXkzBJph9HJD+eVJZYRMw
	 3X7uT7J7I4mqc43hCiMWgTZaZimqTitGClaKaETZjkWkyG8DQe0JqgK+PQy9sk009eG5O
	 WwK+u0CbFlpmGyA9CEY57arXah3C3gFBOtNPPEA7v3uXPBqIBXuOAk8/Ig0af8CB4EMjl
	 /1Y2Dl/QqhRtJbLpqyVPZZwlW3P4GVinliDt3crUbdfWEszqt9VLd6z/U5r4KcW4Xog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486337;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tkqdn+h+quvZr9vw0T8bcJsxvQ/mJoyu/YMkcY/G2Jo=;
	b=F+HRD+V7fG9MMe1ug/QbfP0EFD5eq50F00N6W7jtEMVndhuxi/pJ4pdnnrj3oowSJLcY
	 8h4lozqKF5WedAz31RR7EdJaPsHlwBK7m9MZl3lCe3ySXV6F27R7W6IXL42OC6amWTa3S
	 bmLOCTRmS4SBTfIemAOk1RSnGtsMgaOvBSlqHr4GwmhSWEZI03Zd0tL3sZwS/LLsqeAo8
	 zIksb/zpWmqy5Tqc0vuj/rr4VA8kEH2xUPIdCurNCqRiwZigBopH2TONmPo6fZT5b04DO
	 05WvhlU/95/WcZAEsqh792VrED1cmBe/6QTUkALbyakUQFVWPAM2ReabsuFKRpCb+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VifFGusi;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CA5606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VifFGusi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792486333; x=1792745533;
	bh=tkqdn+h+quvZr9vw0T8bcJsxvQ/mJoyu/YMkcY/G2Jo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VifFGusifNCRwNZ9086C0OV5AWmprlXlgTGT0U8b5CYguiRNKj6NA1yYc1sB3tdiY
	 ahV/sbOkFqqNEQEa4sglx893CE8+7jqKlIJCc/krXJlMmIE0AT8lprEyu6VOjLpjyf
	 KdVMsk0QtMRUr8K3OnuAKO9KDN7u1e4zVoeFR7JxX+LvnG57XpikPAsGa9hmh4nsZZ
	 zqQfgbYuw4G9iZ8UDd42fAOKETSl08ME/6N+ANLhRTeSNEB6tRYm93xbFrSEt7A1QK
	 d+55BdSMWPD+wbx+pzHkJATQp/Jr9eX/cmU6F6qWMtdY0Rtd8eyKwZ5knltbpXMjHL
	 iH1/Ejhrpa/QQ==
Date: Tue, 20 Oct 2026 08:52:08 +0000
To: George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261020085200.60619-1-lsa.uz@pm.me>
In-Reply-To: <179247822513.25202.7960395606350309657@gmail.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d8595080311558c5b70a0b31ff8f4968d8b5aff6
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

Hi George,

On 20/10/2026 07:44, George Neacsu wrote:
> Would you be comfortable dropping that write in the next revision? I can
> retest the revision on the Snapdragon model and add a Tested-by once it
> is clean.

Yes, I will drop that write in v2 and leave 0x0329 at its default, and
Cc you on it. Thank you for narrowing it down to one line.

On the Intel model it makes no difference. In one boot, with the sensor
held powered and 0x0329 set to 1, then 0, then 1 again, each state
streamed 150 of 150 frames at 59.14 fps and restarted 10 of 10 times.
The test-pattern frames showed no shift or extra lines in any state, so
IPU7 does not put the status lines into the buffer, and its error
count did not change. The full test run without the write
matches the run with it, v4l2-compliance 46 of 46 included.

One thing I cannot explain: on 16/10 your vd55g1 build streamed 2/2
with 0x0329 =3D 0 written once per power-on, as v1 does it. So the write
alone may not be what stops CAMSS; something else in v1 may take part.
Leaving the register alone is simpler either way.

Sergey


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448209;
	b=GlyK2dr7wd69ZqM5JM51iUPka7JCkjPcGnP3ol/uG4bxznqpwanO/zWgEg4QL0olfeiu
	 rFM62UQneCUHFsBqlUbh8smoeJUCBnWwfjLC8EKaHRAIaDlMuwVTHbp4GwzBmY4nAhySP
	 /ga6G5W5dFin4V2YBUFq5XfFi4MkpMayVPMKbSBN3I3Kpae6uMjfQgoNwsezT1qDPObIO
	 nI1NTcmTBhFZ2hW+vuLye/79x486wda3aCueGGDejFdIxFOtdwNEJhJ1JE/wZAO/Er7TF
	 hGnrTteGgi6/Yks7dr7c7XYm62oxJytp/3fe9Rc0ESphsLSWD6CPOrWojYZEo1izVTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
	b=AUxV81UK89EMM/nZVg7nzkFjvB4lss4YsqG7N/2FkDRpZlZYqyrBfruEOKFLtSrasuVz
	 ocOUbSwqCc+00Jp9voDjXg4rKBimJZzKA6NzQC95i0BrUXazBYmRlGMc/Uhue/DfmJJ+S
	 cTkUGuOV+9+nvGoejjE9JoIk/COog5XuYlyBMwmR4MdKD4ds0rhbzTxpUzOg0ip3Q98Qj
	 evs0Q8gDTIDaHXPAbQotANNJBKLTPKsjUi/59s3jTqru6U0aFSVypgZTa1V9Olq6OFdn4
	 tinr/CZUv8ynph3FskJ3nQ6pJ3oez/0G6SGi6Qd1eK1xxLWDdLPO3o1BadeVaoRhaDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB88606A32D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB88606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38699cf08dfso3315170eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=Pa3KixudA+5xmoYwPI5y0R6jy5MDkulflIICqE8lJKfL3DNzQ5gKOioxnTuDi2DHaL
         u52vz7NX99cpThPawgJhpnWvFWVI28kEarO3dyMuMa1aXUUtnQmT/0iKk4npJ96KL+qb
         /FyUazn4jH+sgFuGjhMf5mqQ8/j9JnvWq+LA5N6ZC9/cP3UjhXmHyHug/hec1Nk62VMj
         97lFba1+qk1Ai7VGn7dTkUvv9KK0O62ScS+5/nj0z5TDGozYFICzm4yiDhHCERSvWPIJ
         hAyMmjZkt4DYZ40YBcqTG4t4mf3pc/QwOo+4u3VgZMxruZK43eGdPLGFEGNcYzRi9DuJ
         Q6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        fh=cQfmRmWBw7qq5HaCoy/KvRyzFvomUeoic0oO5znkdLo=;
        b=BJk8v9bask+fG8V9gmipAiW+6eD/0KjPKvbwbKb4vmpvacFx0GtPOdL/Aiu/eX6CzK
         q+IrMelwBpwihAW9HoaENUd8CU9SZ5H+qaBq2SlttUSwgAU/RPe7ukoSPOybuKAIL+BV
         adLgGnDSnqfZpclCbj1ESgu12Vg6HQpqt9fbh25SolfDQkE7A2Ji7cS4E1Wegz+mZuAL
         fKpVOnCHINqyhsI76XwVR+yR4sGkXHgHZJlDK+q5vsbHxAr6CEn+v3H7cTexQl3KFNPg
         UrPwl7lj/hpANCX/6rnrk+uNKLmJGFbxpV9RjOqT4pWJ8zBshlCu8iB42G6FE1zyrGA/
         ERrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=rhVeuiyDGD6m7uUohgi9T0W/7eHgowCSzNgM6wFCIaF3tFDNkwX7vA3Ae2675ZGqR8
         zB6651frVOqzOa68J7FiE29B0IyQMmWvjYyPZYUxc4c7V0P4XfXFAed6Ww6FwyAIBHXN
         i0Gaexq7ulQrJBhDuPSVE2JVDW5nQYgL7VDuFrqsMlg4h1ZN+4tpb7QIsnoZNX7NuWl8
         hyJKkfxmyGDo1tKTEzjKYm0/aQ7KGPBLo1SN6/HXQQa2lImCFF/O/58GXvDDk0qWo0f/
         9qgqNhRcbxIqjiwJKCsQ4s7o1m+upIyOc5+6Oghf3OGv0MaSzHXP68pGCZJe3K11M1zS
         VaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=vkUonLs36e1ZBjSChvjCR52sZ1ceXc6zVAA6C/4rBfB4iZVbXKsSANBejC+JR7OtEs
         H9aozQglo+Jj8m2bRw/vYt5coG1KP6Oh8WxRjDA31mnJcLeNck9Ror6rTj47+TihjDbU
         l3iF2/AQ10oqCY5Plbx6XBAHQv4PuQLiX4SluyoV0L6r/YEKs3T26dNeweZ1kkRugSde
         /Ww48t5/WuRJzD3aJVGLS4Qf1UF/REQ73VbMHBF3zKMe7wKaeUKH6ZG8IEcESwCKpJeu
         fQb6vP8GzRxiDyYkGdMpSrYsDiESQ0A8z6YimoXuKtxQI6eWA4fnZFPL9gt3M0lub3sK
         dpHg==
X-Forwarded-Encrypted: i=1; AL+hErHWrlxmd4U50gcTAmAwvolVR1o78DzvdMeJH4Tw1G6R9UQ32PU3GgTGtbodDwcf93bhVosBNdqN2DceGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qhlZKefwbv9g2LHyDwu1hP5sBgZS+TWW/Cs5wzCfLFrbcs3t/
	xBJ1/7BncIyZW68yBG8iqM8Lat7BIQ3sOKvkwUo8AEIJKrKnNivA7C7ZWCWMjGKeySyDsOJvz9Z
	S+FBzZNc8Ei1BU2OcrhmA0p6SanyCv7Y=
X-Gm-Gg: AZFdTZdp3dEqlV2CYx1NVTA2fWURlTDmPFaHyCxpb7QwRKO5xJ4ycB61SY3nkcr8Ant
	ioDKMVhTv5b9WaiIe/eVsySwPXkmxDmE/WcL3S61BBVr2ILgckjxmwybybXyGqDbokJqW0wCh2g
	rEJawdkaaz+ZjqgbaTW3+YWpf4WuIFuj/WjgtZBXtrgnnj7udJPaBPwq2eDSoRBXFdbGD9O3yoM
	7zvq//aKtV19DNkya7M8MmW2w4Qed+X20iQslk+qiBsUBdDjasFDzl1EPS1jIz3N8M15L5T/rev
	tG/SjhaCvFMaKKR1As4NwHBpS/s94HLIF6G+z5NluRSmmoaJ2jk6FsPIqk6H71upg1ggZBslbij
	AImume8qCypEtNLU2E4zfxUtYjFhxDWwgFwFf2pHKMwa/X7dTRbijAMSCyr1MkV8fumZUOg3O3s
	Ihpn9VWJSuY7jPHb22Un9IB8cLQl78lyzDsTLw341JSMyZ69e+iDA=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id
 5a478bee46e88-3856c4b844cmr11761769eec.1.1795448207689; Mon, 23 Nov 2026
 07:36:47 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-3-clamor95@gmail.com>
 <20261123145520.GA2412988-robh@kernel.org>
In-Reply-To: <20261123145520.GA2412988-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 17:36:36 +0200
X-Gm-Features: Aa3M54rUDkGOVQLPkkzUTzUHY6vBcwEurritNE5bPXzc3P_S34AV-IYkX1z3J3o
Message-ID: <CAPVz0n1sOsC2N+MWEZXN3DYGBgLicS=+e-q53KjBYcJtLiWXRg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:11PM +0200, Svyatoslav Ryhel wrote:
> > After further investigation, I have found that Tegra30 requires a sligh=
tly
> > different programming model than Tegra20, the maximum VI clock differs =
by
> > nearly a factor of two. Additionally, Tegra30 does not require the
> > APB_MISC workaround.
>
> If the clock rate is a function of the sensor or input resolution, then
> wouldn't the h/w design prevent that scenario?
>

VI clock rate depends on hardware. If wrong clock is set HW may still
work, but be unstable, which will result in unpredictable behavior.

> Does having the APB_MISC workaround make things not work?

It does work, but my main intention was fixing clocks since Tegra114
does not work properly with 450MHz. That was why I even start digging
into this. APB_MISC workaround remove for tegra30+ is more a side
benefit.

>
> It sounds like things worked or could have worked with only knowledge
> about nvidia,tegra20-vi, so I'm not sure this is really justified as it
> is an ABI change.
>
> >
> > Therefore, remove the fallback compatible and add a dedicated compatibl=
e
> > for Tegra30 VI.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)

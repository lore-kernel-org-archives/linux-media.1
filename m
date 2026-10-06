Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B80283FC4
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287032; cv=pass; b=Wz2HUoyt+BrP9H7VZeMlrtUPkNEVeFJlqUsrTlhe2nLKvopZ1YLMAx1eJ8KotoN0dkyc1C/rIq0qGT4dGDrwiCzD+FLEDN+AmEZCH7XiTT3bzuLhmZ341jDuJC1X2f2q14sbkjDuJMWbSrNcHzu56issSVEFJC5uKaqVv3cq28c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287032; c=relaxed/simple;
	bh=x3rZMdKi3vGTqXwDbjr6PJPvmHZfAQUVoS4iSMA9MB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH+V2O2wFFr3B6uOSO14fFQAL+Zux86eG5ojCMZ3nwQRN/WJGVMlEDo2q+316ka25w3if+II9hetgNxkcLjishpzO5odZh+dgTaCm0aoykYY0e7duFtUo+uKPNyg39VnWNMG6drQJsUQrfxI0ThwNpSR+FmduV2xkjxqYDYkrkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVS6Ld/A; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVS6Ld/A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso18554155e9.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 04:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791287029; cv=none;
        d=google.com; s=arc-20260327;
        b=lUGnct9WR9Y1BEAKgdxuu70cOv3FDLfZrmRK5GnNIwA16/GqAgaJlLPx/kP2kCK2XM
         DEao3wLg8MryeDBpa5980CimR55jNT1mrN011NKEVgffwqUYJnylfw73dKrOkMp4Chkk
         5bpy31AJ3cwF60m4pleERO7rOUw8ma+ogadFj1/kho3qH0JCGXseesizO2C9FQmo+s2I
         1JiJ9WfYOFjbsRLuh7O/gpH4tsK55CJ9K9bm5/Rb9xGwZF7Q19sPJ7UjPc+WIZHH0PPO
         EWP24Ar7O4JJum9eBDBRi6EqyRmJnvtfL/AIZ3cIiYlPlNBep5Itg2yrZLWbn5R2AxyH
         Y7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        fh=IY0nrBqy50+xbAUkZHYV9wMStyB72o9/YFe5/W3H7L8=;
        b=ZgVux8Ah1MR6nAmdAQjKvLqEhc99AE2IA23X0RrsQkFmloNFaYYnmOiz/Oit/DkZNc
         Y6s3xZQV4oqzVlOZX1XnpVoUq4mbtSpm4XnEalrCunYooNi9pfmcgn9TADC/Z8EGKNHH
         yh1FLcn8dgFVDpYb+xQyo2VVLWmdb1//XD9my0gWITNhhS4taezRZ5TPNgklHPmTlfLZ
         x4F8XXYwh4LeCnr7qK12+VR+akIHXX8lNgL+HcU7yq944shMUQ+yFaOOvf/IN9MyoElU
         NIZW/W7q3Ogdg4Sz6FQKKuWWEXsPJUN8uVsTo58tK4uRJirOBRsI1Jj0L8gRLOjUFpgR
         3Q1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791287029; x=1791891829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        b=lVS6Ld/A+7Etdh5Ig9jEnV5cvxOl3AIKY03S5aXRvcWae1Ttb1+S5WFKNBikMH0eXd
         Gfratt2vdBCf7QylGUZg0oJ5HmwWFAI+uyxUQxIMcGqZt9qQG8e/R01G1Q1DfrGsGUA+
         a0svZqbDkEDYk4dbXFiDpmlbNtGyNFWvtl/fj4yHpgAG4WDgvzsw5zM9/rTozYEMCGdL
         UNqLkHeByNpAOTgF3pnLVrsoLkcGvwjU4UWAubh4NzQXt3zrMUEwnmmX/awfa3VUBfzW
         TfHXKHdEp434R9d+gvWhXDTdhYjmUQOP3hx7T9b5mO7qY0VG3pYjzs3dgSG2/UGmXF2X
         BCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287029; x=1791891829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        b=UkRG6YC/6uVASmDZdAvmaxpOl1mz/426dIiuygdUwACrxoiQYAqs9R71JRJfbHB9T5
         QNQJENmfn3qcROvdXOHacyitlliaMoc3VUMOTFlLHcaMcNUbJ83ZWCF0m7vweqxF++pL
         v20j020LLPf7mpxqw9ABMlFgSZYlPduRz5BydlsJK14d5gkJ8OIPGhb6+92ugXwMsaLp
         iYrmC335FtE5W5qzSTgGZC7ZLMiEaI7okWrDJQ0UHwd/yhcxqw1TOejJz0/Ein7M+4qg
         0IM4GfGlx2F4/M4Qdib7y6V6pRQNqvFivOvalasoU7BSYbzYOS5//v/H002SMlKQAzxx
         h1WQ==
X-Forwarded-Encrypted: i=1; AKwUvByS8FH6gfnhnUAeIclDNUwfrnRH2+ofZ7izWBnD1qIsArX8BCE0SMB0toBaXxyuzeW29xVB2oFFHx4fDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kAgddXLz/53iG6eSVOhJUg06jdFjIQsAxzztfaNt8izrPLeNo7
	m2BJQeazVIqXIIMZDjah1yoRPePXnlR+wPk8uJOCs41KsuGv92mlwZ/znucJRoKr0dD+sNKDobx
	h07xp7tV0h2ynjQaTc5uiosQ5HtznWOg=
X-Gm-Gg: AYBFou1gMDqv1vRnI+MBtPneUQ1hW/btREG43CwqHnHFW9ywI7HQ3apfb3es+NOqiN9
	Re3gNVQcOBD4GgoU/RPdcFw0No+/EbZAilKPHf03GJrw8WjNvglkxKpJ4bblEIPYKmPGyI14IgG
	klKGbLQGzWtVqPTYhOqR+ItbqnvGUbCMEpi/WDRCZ7Qy2uT1mgHMe1ycrJuJhWi+D+dibavs/u1
	IK4f8AMERImnqeyVSRuuq3Iygn9d4XvHjOhvXkYT1OnRDaGfZmCdTiIkYneLfSdOksUvjqK5tyq
	zJbRSaapfBlrhjl6nZ4+aKTZr+TBCMilHKTj++9WgioHr+TG18IQ9ab47W5hOOMruWPOezMy7eC
	mrRxhqDyNO1zHN3T29IfSnRSV6qn9jvd5IvlVy6pV3h61lcVWInNuYFvFSeZJUfVyf0CHRFRiQ3
	7S2GSlaEM=
X-Received: by 2002:a05:600c:45c3:b0:4a0:2540:b46 with SMTP id
 5b1f17b1804b1-4a1680e5babmr175664345e9.12.1791287029030; Tue, 06 Oct 2026
 04:43:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
In-Reply-To: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:43:23 +0100
X-Gm-Features: AclHuK8EEYHZRufa5Q70T_3oX3Ok7xh0rXwO38lzCRt9fe8SDgh9FN1A00CzUvk
Message-ID: <CA+V-a8sSaGYcMUpXhX+mr2C44zLj2Hgnwj4pQS1t5YrZN1ejqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: mali-c55: Fix IRQ lifetime and wake handling
To: Linus Walleij <linusw@kernel.org>
Cc: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Sep 29, 2026 at 1:08=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> This is essentially my reply with the "proper fix" for:
> https://lore.kernel.org/linux-media/20260903025526.2657105-1-dayou5941@16=
3.com/
>
> Keep the Mali-C55 interrupt requested for the driver's lifetime instead
> of changing interrupt ownership along with the runtime power state.
> Synchronize and disable the IRQ before power-off, and enable it after
> power-on. Hold a PM reference until probe installs the IRQ, and stop
> runtime PM and drain the IRQ before removing the media entities.
>
> Allow platforms to mark the ISP as a wakeup source. Hold a runtime PM
> reference while IRQ wake is armed, resuming an idle ISP if needed and
> preserving an active ISP's configuration. Balance the reference on resume
> and failure. Hibernation still uses the power-down path.
>
> Wake events require a configured stream and an input that remains active
> during system sleep. The internal TPG shares the ISP's power state;
> external sensors and receivers need their own wake support. An idle
> pipeline is not started by this series. Hardware wake remains untested.
>
> The first patch extends the binding with the standard wakeup-source
> property. The second patch updates the driver IRQ and PM handling. The
> third patch retains ISP power while IRQ wake is armed.
>
> Tested on the Renesas RZ/V2H board with the other in-flight patches
> (DTS changes and the TPG enablement) doing full suspend/resume cycles
> with wakeup from RTC and NMI and capturing images before and
> after the test.
>
Can you please share the dependency patches or branch, as these don't
apply cleanly. I tried the latest 'next' and 'media/next' branches
with no luck.

Cheers,
Prabhakar

> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (3):
>       dt-bindings: media: mali-c55: Allow wakeup source
>       media: mali-c55: Keep IRQ requested during suspend
>       media: mali-c55: Keep ISP powered while IRQ wake is armed
>
>  .../devicetree/bindings/media/arm,mali-c55.yaml    |  2 +
>  .../media/platform/arm/mali-c55/mali-c55-core.c    | 96 ++++++++++++++++=
+-----
>  2 files changed, 78 insertions(+), 20 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260918-mali-c55-irq-supend-resume-30b507a20011
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
>

Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60C46EF7C
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796827; cv=none; b=riflx6kn57437gVnvOpvLYLdnEwBMFdMGEZATzBcjMi6AJP3Zlg6K0hlngeUvow+M7F/LoG4F1iwfUhHpYClUg3Pl1AMjX57MpfmQqVRHWW/mRSQS9sdOCFgfYwSv1sdJKFOss4n2kbxX0iy5b/VBcXK16pNNZ+GAm3ZeLTKJdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796827; c=relaxed/simple;
	bh=gxi33VLZ2gMppChwwo0+nFM5QmAtnoZp4a1bQT4ATik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgoFoPyT1WCCtGDXg/yjX1fzsY2K5QA3160b57NeTnuVK2RaVq0Ouf/EfK6VfmCJSbfwPrSadnC5/yXj8PqSGR/asyr8JBQB0N2HPoUIa4ZEmyIkbFeA1W+jikUGRItNXMfC8qS/skc3rIXYMX9/JUxNeZzmUIsb71Lw7Xw5ybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so308691241.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 02:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796825; x=1792401625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R9Z4v42/hEW06uLFS0AmempJdev8RXIeASGOWREk38=;
        b=qi/cdTlQJTx4o/T7wN6E2KffBKneRme8vjxmQz2B3mFTwsazby0Zi989YgF7/PiGBk
         V1wiwBm9eNgIGucIdp59LXx75C6EXGbXHl4hzkg/KzPb1IDPhu7UQJ/qL+1Cg9sjxKHd
         rf3eVan5TQl8Vml4bUzI11FmGMX1WvgVy7TW7/u5CMY9ImiRw7a6vszjgGfiOwpHr3em
         rCkWZbhgdmQOxDYZEL5qYiTpylhKk01jPxXWvaQei9HS1AIcLUTxcJ3/f+nT8S2fLNSv
         k85I8d1VLzCsOWHJC9o3B9DJC55XzwNLEhxCQfCFlj3lqsfIyX64ODQqk8xWJ/UGfLwn
         H2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKdPXWfpmDQVbJy3SR3UD3B4L1LF3/KyteT4dij5b3f4tt/YzNMfj55SVIXxNGdvcMaNwhmFYIzW57wg==@vger.kernel.org
X-Gm-Message-State: AFq9FYILXzHsWyEMqNWc0GeqQGcPrFKLGgG/x2j4klZEDBJX9UhmM+uf
	plii1j8pN4OVZ7jbM/G80ovu+CkYMFz24qSzEeM4iGaKhzaNhe/FCjoUcvvM/Bs8
X-Gm-Gg: AYBFou3kMjfG/5BwAbhXmQp7tlaLD+NhS/UElQmaDhh3O9LWvxavtpdmMjiAf5iE73m
	7Akvx2eIOgyBnG1PSEVSxdZMCtzrnMIPzrgh3IxznRCnFyaRDm+ka+u8KkkjMu4YqHD79+FZ/R9
	94ikLkOZJ/ZKdbIkfmPmVjVjYIOexDgyaO7GADAHn+uRar+Xajn2gJfjL+wfPurtINop+WR2/a5
	ISgb2DQ58X/7fqdwyOpcrZFZFnJVjXdKl1DTpw/YVrpBt8tCBUmuFTwFZaB+Uxd+B5vnXxq+G5K
	8PHSiyi3+/t8B4Gg3WrXRWiw8O7Ovu9kFKmW51boSHYyASDikhGk19syjOrvn5wsSDvaUvwbhcn
	M3MWBKfTC/ZjOz4QXT51vvCjLuyPioBLfTXhw6DqH/m9CiywQsdmM1k23djeuIl0D3gL4vBU61K
	4pHxLke+s/ayS+sKRnGkdIXw9GsAHibppXb3V3FuYdaW74wSmtXlTjDch5dqej+NixfEaMNFFA8
	xY5c4VgG801632ZWlDQhHqlRFAecc97inUatxVpvHTNL471Wow=
X-Received: by 2002:a05:6102:1624:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7cb372554admr2051175137.8.1791796825206;
        Mon, 12 Oct 2026 02:20:25 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99007c130efsm5786780241.12.2026.10.12.02.20.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e94120192dso510053e0c.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqme0428Q8vmTy5lutWgiXlx8k+tXM/HQX3RmdEGjiRzdU7k9s+CklPkC8a9GUG0NmV8BeotHWb/dyaQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:7cb:1df0:813a with SMTP id
 ada2fe7eead31-7cb369879damr2230386137.5.1791796823865; Mon, 12 Oct 2026
 02:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
In-Reply-To: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:20:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
X-Gm-Features: AclHuK9gy8WPXA70y2ILBUxdR_nY10la1SOqMg9bhKMA4oPFypGa7yRQ2ztCmtY
Message-ID: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 6 Oct 2026 at 00:14, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:
> > Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> > interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect t=
heir
> > video endpoints, and enable both blocks on the RZ/V2H EVK.
> >
> > After these patches, and enabling the right Linux drivers, we get
> > this in the console:
> > mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
> >
> > This was done in order to enable booting mainline with mainline
> > device trees.
> >
> > Assisted-by: LLM
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Rob ACKed the final DT bindings on this v3 patch series so maybe you
> can apply it?

Media DT bindings should go through the media tree.
Thanks for your understanding!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

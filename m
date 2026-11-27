Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795753509;
	b=3I9dW9MmeJVLeED68eHTQfcYadaoBGehE0GME92ASN3lyoWcymVDi5clh9et7hqoepyg
	 96BUbBN2u+FO0xUOvl6tNsoPZIFu8JeXpa04ifDgVdRnUTe/lGSbWhw2cx4SrbAejCBBO
	 Y0nLT72IxqegC7D0i4xli84X4ZqUBIn6vISUDu2SpHKy3nbVL7zt6Wa5bTWbHTFD5HjBj
	 K1MtsR0jUhxF/k+WENjtWZSiDA1APVvqipvcPtnjtVmHgzN0DqsjKrP0tBmezUX+CI3tQ
	 2v3nmY7u5oEAwdj6HGpfwBRoOyKP5Cdt/Ac/lfIirIOHbdUi+gfM/3iO9ufaZPGqoeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
	b=dI23DPUQFuVwKlzpa7xd842O/wCJXAk0c1QkIR8gLg1pFyeEypNaFqqdQT6MW7Fb1cdP
	 jtVCw7HWpYAX603bboUwolVQ4yv8VzYs8NopP4Tx5pKp6LCNXksdAu7xWWbVQbyo8dOLu
	 q2aKAn7bryep5bEcHhs6CHGR+B7X2QL94LC/3JgPYrK6C17ESGl1DtpjrLRuETP6c070t
	 VZ5h7SI5Ra5Pxvtb5yiV+4rW8EXYZRTqL5q+1HjUbJEwP00fjhrygp74ee8c+3icZQYnr
	 jxUO306ovV6hU2ydtoQs0I1YoTkXgnJNvoC2sMPsVsQEJ7jw6WfNPzcfQjOyhoR71SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X06RW4Mg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF7D606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X06RW4Mg
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a76f63b243so6246899fac.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 20:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795753507; cv=none;
        d=google.com; s=arc-20260327;
        b=H+OgODj0i/qUNCxLRBJGzt0vKMlTMuymdZ4v81F25RQIQdvPnQ3c++mpLmWZ6s61Ha
         vDXr9jaeUcvTY60XynI3PNfNmtF+f6A9y8aQjR7ytzPDwdKEICN8izJuRKpBTzp1bAx1
         N/CPS4l9kHJClP/ml3nOFFqeue6p1FgBOM9EedZcHe40B8IXz9ZEJ7+cSKpUn/CSGjvA
         lngg1bUjSQrCli8+PPtjhMC8KeNm1nu0VrPI53Ku+CmzP6Whix9kX9xsQcdWDYAkV1La
         xKhHnMa4GK8KtayOjCSu30iYeBoWMKBFYdkziSwbTRNvv8JJSj+TUtDLHOo7MUC4+w6D
         08hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        fh=2NORyexC5XqeFod9PqAcPkTFbvp2tKOglja66TNFTmg=;
        b=CAHFpnZ+F4yxNfMAO90eZxVAoz9T94yCKmQ/399nRW1gYgVN8uJN8CR9Fy0b7JIBnC
         rd3Usqe5oTTJLUgzbLQ9FlNIrhe3Jciu6y7csXA+HmBV13D6Z/4U58NBPfSf8K8t/sZ5
         fBR9rysqzMNOaZLAcifLVK02u2o1ActugISBa0uhgy6OxVHwEgof7Hw6XmmOk6WMag31
         migUuyBVYmViK6ALZ2Jd2C9rYTAxVW3B9wP6jUgDzJC638RO93b9WFiW6oxcFM05rdnM
         KR6/efjf2iKlUAXZYKCZW7h46F78N48szivV0TMPNWZJR7wMYu5Zw5kjGHAZH7+fqeyC
         DmNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753507; x=1796358307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        b=X06RW4MgOUpp8sNfKRQcriFDcX8eqcUnpz4ArGN4igtxQv6BZnfdtsuCIFShsnx1t4
         oy28p0gLg0zVXfNKPPdEoAlQGFXvoIjI3s8StB07FOI1EArHFjPI6u7ForlakIqp+Cr6
         etD1f5krjDdeWTGMbnMty76YkZxi9+BxoyGF5G5OjYWFOjEovvizZi8Za/QoEsbMn1IC
         dZ7i1bSjtDVtijHHjQG4bTgQa+JpF5TjJxMsad3LO2eFr3XvpRVb2wGnNQF+W/qIzO1c
         CEx+viHJr6hE0vT+z7WeWWPnMuiT8s83AjEXDnrY7ejiegayUtXMaq2sURe7rHAcS5Tt
         lhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753507; x=1796358307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        b=w32O/JieEjVF2LNVw4CG3D0qnGgw8WfTUkmKHnFBR592JchSadgzz6gOwlz0uxJUvy
         /8tH+g6qhrnyy+3dTdfBvk2xANFa8EIGgMybYDHMVIUUILoeJ4w0k2CSQiVs82fKVxSt
         S8dr7xhlkXHm4IrwgQxCJaNhVQxpz9Ky+AQ7omVEGFRVrLE0lXhgrFKBYRwCDDbscB/R
         HhouyYCsGj8YRDGk1t6rnK9qxBEuoay0F8LDtsb2hfZQArmL65POzMF/HV0/6xYTiCYn
         UM6e41RBZDOrGP5Ot5L2g/OL8HrWHiOKSRDP/Mr0GZrgtJ8bUcd7eEXg/YvOn1fECAPX
         1uTw==
X-Gm-Message-State: APuU4Z+I0lTJhF9QLhmSyPc9uIDFub4tkAuX3ayVg7CSX7PTOWyM+9jq
	NusXqOofSRKSPBDKPEiHlUX0ruOK7DnpPY2jWESo6BBwBlMN78aGYDPoPW23u1hL+6nLfxVDdL3
	wM7SOS17FyOpNUz16QHhroxf7FrEu1RwhaM3AnIMrzg==
X-Gm-Gg: AZFdTZftZJJ3ObxzoGQUlbtuJaVO741nC7kRWaNXb5BD0Y+WXcGWcdZNZwAI1lzFxqR
	zh3jHiRLcqnedvPT4PpSLRpCMKCcT2D+oRslWl/Jk6E/LTAJxqw0f9q22tYd3O5rQptm7OYA4nt
	mv5J3LX75TZTfiDJqsXiZxiDU1yosS7+K66cubIyvmI1DRTFfZxOw414Dp/8fRrmSmeWbL2ui/+
	wDDFXV2NbSdXwYkii5mVr0i86AIU6YnbckA4NJWDE5tYv5kaY3ONXLJcZP17FMVU69OJv26sXek
	dClttzSaUWvB/QSPDez+/lZN0xTOwVJx5tXCdjKdmKKDf+x006T1rjeoKgVbfxaW68nlVx+fcKg
	s+UJa1QATPAyxvxPHlIE7pV6i5Vq7l1Qb43g3qqjD/cCbOMQAzfPcnKErX8nmBS+YzgMr+stlnQ
	TZwqxfPPQ0P0u/fATDBk57bKY2
X-Received: by 2002:a05:6808:2383:b0:572:f8ec:5340 with SMTP id
 5614622812f47-5797dd97e12mr17446004b6e.40.1795753507571; Thu, 26 Nov 2026
 20:25:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016113846.8602-1-arash.golgol@gmail.com> <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
In-Reply-To: <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 27 Nov 2026 07:54:38 +0330
X-Gm-Features: Aa3M54oshEKj1zUWUb4kWDxcGN9dYz2vo17SWP_9ajtYh-JXJ1CIiIPrqckXMbs
Message-ID: <CAMxPZkjXrHYT8DNwGCiFDfxRYxpxu1VhM2m0MrdTjG2_LPJFBg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM arash golgol <arash.golgol@gmail.com=
> wrote:
>
> Hi,
>
> On Fri, Oct 16, 2026 at 3:08=E2=80=AFPM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > Hi,
> >
> > This series improves sun6i-csi capture and bridge.
> >
> > Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
> > and height to 16 for NV12_16L16, as its 16x16 tiles require.
> >
> > Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
> > same alignment.
> >
> > Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
> > posted earlier and carries Paul's Reviewed-by.
> > Link: https://patchwork.linuxtv.org/project/linux-media/patch/202605271=
24552.33815-1-arash.golgol@gmail.com/
> >
> > Tested on LicheePi Zero Dock (Allwinner V3s) with:
> >   ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
> > this setup, so I did not test real streaming. I checked that
> > v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
> > --list-framesizes report the expected sizes for HM12 (16 aligned) and
> > NV12 (2 aligned).
> >
> > Arash Golgol (3):
> >   media: sun6i-csi: capture: Align size to 16 for NV12_16L16
> >   media: sun6i-csi: capture: Add enum_framesizes support
> >   media: sun6i-csi: bridge: Remove duplicate mbus format entries
> >
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
> >  2 files changed, 39 insertions(+), 18 deletions(-)
> >
> > --
> > 2.34.1
>
> Just following up on this series.
> Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D32=
161

I appreciate your feedback on this series.
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D3216=
1

--=20
Regards,
Arash Golgol

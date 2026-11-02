Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793657335;
	b=mvYQojblzRy8xUICZwpsi3cF+JLi0Y30NL3Aud1vpoPkV4uZIKzBxSmgxGnThxPZrT7D
	 9KZEckAIQzqR4sG6GUNCkusGj5t+ztAUXiDSyzy9geq6eiA3ihTPtMMnufYWZ2AnCAIT2
	 YW7vH+CM/zMSjEK+UnDUvva8m7Z8xkuX2EqnolDqa8/Tc3O+oJ35yPgOwwV9AtHOJtUvM
	 J06+wNcv9LoogBX5YqTad+P53qh3gPQNU6+9GOBsaCK5ve76QkI8yJlS7deAp2wE1IYwp
	 T/ju5DQHyWMkinjaas0bEjO2pf59ks6jBxHjxRxSqKgVSksd3eZwzOOsPPCzDnFlXMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
	b=yY4i5Gs6ae63SJnguRtBcgyYIMpSI3yGqms/Vf6DHSGOxC0NNfjLfOAPzk5SQU3jLoSV
	 k8I7LCP26+9PVz38Xy2+lFXn2Edi9O/A/ylZLlwoxEPe2+G1GwFJJb6vMA224tUQXwTb3
	 DnXfq2v8SiUKiHvru4Zum6za9IgOFJPKHsgjWwGKKOKr9DavFH/wjm0X85WZd2JYQ+6WY
	 Jhyv1VQqR3jlYk/F8wJ8TlLhlzuRtCVswQKzkuFi19dh0qi9q0WG00v/8bwAJPSeLCFpq
	 n4lsUsPRlxMLMPrbr3fvnb2WdXhhvkoV1h+C4avLOiEjcNUwNPo21ENoeJJoMu/lbSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQVmmG6P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E6606A327
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238E6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQVmmG6P
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so3159a12.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793657332; cv=none;
        d=google.com; s=arc-20260327;
        b=PjjUWxBNpyCCk7v0kHm1O+o6iPN8EWYk/6ZoO1ysRG1bt+pWTVik6UNS+cYCV4YoD9
         KlhOO6416G6fCDLlc/B+xv6I0YCDamFDy/GydGgvX07wnp5GTURh/YzZtIcwE9yIMVhm
         /JS+74R7kvBgJyIrnJidJyyF7AS0CHzTYyC5VGUb6K6UpEU2YbRvmnqIWJTZKrbX/mbR
         Q+ipcemL8IX0qJhB3vLCVeR1riYLuizQgrQRyaVR6ADSTWG0KMNDRfGeV89fHezJGGDb
         H6CTAdXGOgxGPnIXHCzoMIwr7u9IZbflOZYi+j457aRlgEwN59EmVI/zAVpMl7GOiC3U
         V0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        fh=Zj+ktVaWwAKf3IHMkbV9syP4VdPagk1fGexnv3wGfWc=;
        b=Kt0Xlh1d6wikgtL1mMs8UcH/qbbEF+4X2KGSQUqXONJ5Kk3RnC/4cCNdQsTGksFxsg
         EwFBjfuoArbcwOEUXjzp/4d7ZZyd+818XrTG2Vhul3BbSaDsz8NW2jbGf/5WreTtMH8M
         oICd7Rt2M54i+vm/K6wfDpVOcEvnXmyiGdNiLiWkRrXXFVDjcPdc2hw6f0RscNOBOVfi
         0vkn/uf+SuusN/H0Hb8Alj/BE5MyH5ZE/s8Rp5BZ80ZyzCpxctzLNpBx0qNJWwquAPXW
         7mAPgalTB72uj5MypIGDJc8kbGAMHaF8Q2/Mj+fFaEeMxk+NyvGbBTqplc/cwFXa8T0f
         6WmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793657332; x=1794262132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        b=NQVmmG6PVNjIV2neyCA9M2St1Rsk5SaTQnqw5Z6BjHpTxwxLNWVY8mIkPbVqVv43Ez
         g1kwACtxFVkWQNTvKZae+D3NXZb1mGV/FYrWMJmL1ujN5VbI0phU2UUIvZ1RySl3e3Zo
         pSWAqChgMM4wStuo1gtjzteMY/kaOtiT6M570xyqph8/dEsROs5zKnwpOJAET9qepMSV
         vCdB69pn/VvgSV+86EtlwKhYvkM3M3xgeJW6A9qGry6TY6rHG0YTPrb0+QZyIpwScHCC
         ZGyoBcYE1XaKnaLT2NSoMPElQaaW3yDHAgebA3x6qLhgrJbVVPEyWmoctHmuVm5Jwrjd
         9rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657332; x=1794262132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        b=coIPNvIlgTrtODxn7pMwN/qSF3rBE1QN4dYVsUn0xNCfgSIVSB67sjV0P5fH0IcP7b
         JsuF2QfIz6xERr+hytqmen1ZnNM5F7AB5RY9jNPKu9S3w+TkshYhF8C++kX/IlX+3rRA
         X2dyYj3MjVQbeLybh2nM+aMbpDV8sSq5fjJlJ0fj94DipKUrXoABIUplYxtZ0ZtaXRHG
         NJG6h2T8z7JsZZyh4rhTiqkki6+wUeGzKRo6gqYpiDfGrHGhWBYrQo9ldY0daxxkUxmh
         AdEO6RHeQF5twK3oi5wc7vWmNtJ2s875PkcdLWTTi+gbRyu9EUDeOgel6hhMpE0OopH/
         tdvw==
X-Forwarded-Encrypted: i=1; AKwUvBw58RW0cnFmti2IsqKU7T+6pHYMU+z+71hIWqEYhkeEmyU9Xutz5CoAuJe81+IynbPCjVd378DlsMEVAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XswtBG5Iv2nSo6mU2XSA7CChl7pWZ9d3PRfT6/5X5UB2s+oOY
	boJ+YODbMBNQfXNbitXdZ4u65r1atl+oTMIXdEhCWfsLcCIISdaACI4RbLOWuJ1wQbAIQpvfY1H
	bS45g6VetQx0nHxvcOuUNIVK8MRvPEfC2b9NEFZya
X-Gm-Gg: AYBFou2lWL2IvFprW0VP6uTl8G19l/JRSSG4y8nLNejM7T+1F/dLPuFiVXV5nDXoKnI
	bPa5df4hMpjyA1ZXtZXHtFnnxgxfhVAvlpKqEcsDJfABouSIYtmmQAgd5nC/bknGlH957iCFFej
	6W5YGajlZ7Z/dxgCe4Qv2YskFbL0ibz9am53Sup+XvBZdINS97rPP5laxdyL6eU6ctmFggN7nMB
	ZZ6X8DrEHvfFPygjjP0jNiS1Li0LMUPOHE9OYg02f6bYBX1o6d9RnmUUhwEvj7H2kJl4VzW0g5S
	MioEsIhqew4hlwd8jE/9y3vV0/hdoXzPyk/Jm4aqXNT7tho1flBxltlzY25TfbWUlVV7a6amNdW
	wSb5d8npIQgxO91fdeP7oDZZuuYMAJh4MA2wtbDFhuzcrnMp7cT7WRgNuPwCj7ZNecLY=
X-Received: by 2002:a05:6402:438d:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b53e778d41mr6126a12.14.1793657332128; Mon, 02 Nov 2026
 14:08:52 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org> <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com> <20261102185856.1824792-1-almasrymina@google.com>
 <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
In-Reply-To: <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 14:08:40 -0800
X-Gm-Features: AclHuK_l2m6u_KEy2pbXoZVvzOwIMj8tI1lJiwLeWg-R9MKJCqxW8rPbMreP4XU
Message-ID: <CAHS8izNQjF6nzPym-kXO2Nr6jv5oKsnFGCNYWZH_zBTGoT98ew@mail.gmail.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:01=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 11/2/26 19:58, Mina Almasry wrote:
> > On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
> >> On 11/2/26 00:16, Mina Almasry wrote:
> >>> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
> >>>>
> >>>> - [High] The dma_dev use-after-free this patch says it fixes can sti=
ll
> >>>>     happen for RX bindings made on a virtual device that leases queu=
es,...
> >>>>
> >>>
> >>> I know about the issues with leased devices. That needs a bit of a
> >>> rework, which I have done locally, and would like to send out as a
> >>> follow up fix.
> >> Will such follow-up rework the code touched by  current patch/series?
> >> how much? I'm under the impression that at least the fix for the issue
> >> reported here would be quite overlapping.
> >>
> >> /P
> >
> > I pushed the follow-up branch on top of v5 here so you can see the exac=
t diff:
> > https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease=
-bind-map-dev
> > (commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-d=
ev)
> >
> > There is some overlap (~55 lines of v5 touched across a 6-patch +262/-9=
9
> > follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, =
passes
> > the net_device explicitly to net_devmem_lock_dev(), factors out
> > net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue=
_leasee()
> > skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().
> >
> > I kept it separate only to keep this net fix smaller and easier to revi=
ew,
> > since the lease issue is pre-existing. Happy to either land v5 first an=
d send
> > those 6 patches right after, or fold them into a v6 if you prefer avoid=
ing the
> > churn.
> I hoped for something smaller :)
>
> I definitely would not fold the 2 series.
>
> I'm wondering if this could be considered net-next material? pointing to
> net-next will offer better guarantees for all the work to land in the sam=
e
> release (no need to repost in such a case, I can apply this one to net-ne=
xt
> directly).
>

I'm more than happy with net-next. Honestly so many AI-foudn fixes
requiring so many refactors that net-next makes sense most of the time
now, for me at least. Thank you Paolo!

--=20
Thanks,
Mina

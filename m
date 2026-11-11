Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794407452;
	b=KUhoNTYBcQ+CHN9JxwVxkix6/L101TgC01wKWyb99IqTAVnL1Yjh59YlRQJzRdk+X/De
	 pq/bAcoh8jqqW9bCxB31ca/VWlUOMlzoNfgfnQiRRDoo2UkFKQ157h4oYacbQ1vgLa/bZ
	 jqxUy+1VQnookIRa1lzl8faPUlNKSWs9e8jvRuVTRweBJ31LcSod/2tEPIq+1IM3CowUF
	 ZM2HJJX278MSNLsg/H5PVBDlOtQSs6WfTASquJq3PV9oOKkaSeuHu5MaEbfa2D9iSDG9W
	 8FjcsWPX4NppiaFcSrok5sTIO/giUqP+fg6NEIFwk5sZb7bUH8hqd/t+3+smrbZffAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=BvV8/3lSHz1ZQ+7MOlPkx8prd3INS+/ChgWkq3sYT7o=;
	b=5ReoCFAMv0hKhnT642Yzk2yb1xX63HYfckj4sSN+a7kbub1CZ3zsNSkF43BX1GIUtLnf
	 BGuOqecR7vo3p2Ak4fX9rLSNSjLDtdH9RbBrh2GN8sDGAyA5FZPfpNs5mIbNrAfmYDezX
	 m2LRRnBQZ0CpP0+gtZp45rUCBfyedj/7mF6ImoyFcEV4m6FOhtq9O9prjAfTotsdE8eId
	 m8+rh3x2RZnVgbCDX92ccLD7WTahIaDmCcwOS5v/NY5JxDzJYuWGZA/KzodY0FLdSdnOD
	 Z3NRwy9ZPpn13PqmF7W1rKplYZQjrKd/E8fpN8d7O3EksEvsrENfE4tnK141sWmzDoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuK2xIUN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926F606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1926F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuK2xIUN
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53dbe9b8d6eso2415913b6e.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 06:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794407451; cv=none;
        d=google.com; s=arc-20260327;
        b=HYJHhZyqf5T7JKnFzeY+I+vyRdu1GN9XXFLgIooiKZfddMIb7IwCW3nkGrzMc95jz3
         1W3hvuypRgJOaRwT4Pmp8oEpPqNPmpz/NgzdQrfbVcr+YV+N/0eO1tm8XiMjWPjfM92Y
         qGhsGyBMbODuk6S07lGqzP5jhVNOT/PSRaHoL2neYPYmQlJX0M6j/0tHuR91c8FIIKbn
         LHc2DPz/xZgrYKS2n0lq0zcUmPCTDsZFaJMBqd4HV1HkIqX+sUWQVAyIsqZJ+d5H7nsa
         gmXgQSIN4EEC7WXqwPMMJxEKCwlOMC5ZZs9iutiz6dAJcO1c53flb1ujDG1CMO/Tpmyh
         IxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvV8/3lSHz1ZQ+7MOlPkx8prd3INS+/ChgWkq3sYT7o=;
        fh=GCv9WHjQ9XHTF6DN3BN53zCXiaY7ywktj1unVDEtSBU=;
        b=qFNFzreQaK6/33PPS0hoOVQNj+dTQnyGmXolNZMAAIysajfUQ3pJNIaxzGWgyu4HhC
         L5LWc/gIDfliYg2Pbn9x2g2jNBHmTqviFwycmBrfsmcGeT05JJN0sByQczSWuhyArWLL
         eCZgFgHZwEuLUfpCu9OW2u5aat4eGL4dGrsbjO5DR+V+UTwOEeGwJVTMcZodCtRxXOiE
         NlpukmJjeO26LpoRNO3WgUipJSTshhwc6XLwgx6ZNwLIr1Zaq7XnEFZ3vXv5F9wVvPqa
         fqS4++l46KUo4UrDiCTx4rmoXUyEGgHMlDoB9t0fewWjT0lU8pMuTfDAttWY8XfoOnY1
         h49Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794407451; x=1795012251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BvV8/3lSHz1ZQ+7MOlPkx8prd3INS+/ChgWkq3sYT7o=;
        b=tuK2xIUNi87M16742NLsrHzshSwrTYJ/5k/HUF6UAJUyfVtyMLMQAP9ZU0y5mRTzo+
         +Einkk0CqtpiSLeOu3VRtVveMKKlMzcAWDQOl511nf4xws7rh0G0YLORPKCVyu4Sj5XB
         CxCsn2TFNGxWoson1wHCpP/iHPBkcr8ziOaO8UF1e3eAwLraJfxE7FMP2yCecsY8R/pP
         6x+77FXC49Lgd8Svno0pZpUtQu4vfQc5mzdSl+yf2deNCkh7OCDAASOyCHPjR7Qes4T0
         Eg7RKnNDfMBS1X/jTcKqR7FScH5xsGpx8i5yaXhfV8jYI6mSbuvVRQuNV6mT8p7wSYna
         Ys8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407451; x=1795012251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvV8/3lSHz1ZQ+7MOlPkx8prd3INS+/ChgWkq3sYT7o=;
        b=1bmKN84xu3vVnpJj1JZbhhYoocJTp6SgHLv5fe9DSmoxRf6qpf9Larslyg2uWWHslt
         5IhcAuEavY2aFmkaK+sMlZHh18BdhqayHeTb0yzSiLwAk/4SqZIBDhgScN+qy5GylIdk
         Pli7qn6UXhTZvr2Yoy1yt4DLVKyRjy5Q4WQzlGeQcBQI8mYssSQz8BwpABzVVCQpbpsm
         CZoEHqG/oRVNko3SoM9IFGcgLBu8WVvYRTnZi1xya817ytUK3ei9w0iL5dDh/DnYiMhP
         i2LjG9cmKhJIAgfQRI1vgX+8PC6BaNQGnIqFUIdqI++UCUc68Y3k/LgPeQDUpnrNfC+r
         61ww==
X-Gm-Message-State: APuU4Z/jxW4VcRv+x0xnPaK6dpWAT0Limlyg9l9S3ORTvwdniHFAzrRG
	wXJygmTwukpw5T8RiyNvtYT9ZFyxRkJeQ5TIwPYeC20wQeiX1RFyaleJT0sQ2+li8+jrGSuAe/v
	ZivsmrMoVSqbbK9G5vfLk1Gi3q2sRn87kwA==
X-Gm-Gg: AYBFou37bYa4dJ7xyfSOu8mULQvs1RRpCUaPwL8tJu9GF93DdCj+u6XMnlE/Nl/2UHU
	yIg7khbgmDz4GmJrPTBNZ8lw75muV6mC015S1Vz5f1FsizFKYUx+reB1YQN0qKcYwDqp7amHZf4
	TfilGckF0amHhx7onJseOQdNt2MFa9rQFhJW6KXtkbjmQCqDWsj6GJGgNCxHgXm8m9W2hyuiKBR
	WPhtqXNs3VT6d1mHgCFlei2aqq9AJYjDl6VIE3hhFWD/EukiuY+y86QAaZc8Fw28qcIggdv/ViQ
	GgS0BMhh59YTyyoIgIRj17rXWYwwj6KfbMuNr/rm7l53BoWnKj4/Hm5/HKes9UN6HTsMyDpCkca
	h4BLoFlPEFuOjDZjbQH4wF9wCdfNQKZjc065PTYow+iIY37Ee4d5mVRMucQVi1DBSR+ejkZTx1w
	0+l65Ko6C54On8k7So52/2WgEAWHmx9wedadpyjJtlMZ8O67daeywwIIW/L+SXqcpFiVaKzrdp6
	RHghswHtcLU
X-Received: by 2002:a05:6808:1a08:b0:4dd:f8bb:e1bd with SMTP id
 5614622812f47-56881290a8cmr3090688b6e.13.1794407450903; Wed, 11 Nov 2026
 06:30:50 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <adeb9e3e-ba93-420f-a9c6-f56a7d3b6bbf@kernel.org>
In-Reply-To: <adeb9e3e-ba93-420f-a9c6-f56a7d3b6bbf@kernel.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 11 Nov 2026 15:30:32 +0100
X-Gm-Features: AclHuK_C187-zz2O3xG_w5h6q7EJtTh932C9QiGjVZRN5mEnEvqKuX3nJHs_TYc
Message-ID: <CAPybu_1xybyiX0hp+kKTEW+pjCNXrfZEYFH7xikB3Z3zfaBSBQ@mail.gmail.com>
Subject: Re: [RFC] Media Summit 2027: one or two days?
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans



On Wed, Nov 11, 2026 at 11:16=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kerne=
l.org> wrote:
>
> Hi all,
>
> I propose to again co-locate the Media Summit 2027 with Embedded Recipes:
>
> https://embedded-recipes.org/2027/
>
> That conference is on May 27-28 (Thursday and Friday), again in Nice, Fra=
nce, but at a
> different venue.
>
> I have three questions:
>
> 1) Should we use the same meeting room again in hotel Campanile? I really=
 liked that meeting
> room, and the price was reasonable. It is a 20 minute bus ride from the n=
ew ER venue, so
> that's not too bad.

If it works, why fixing it?

Maybe it is a good idea to ask the ER organizers if they can lend us a
room in the same venue as ER. But in general I also liked the hotel
Campanile.


>
> 2) Should we do a two day summit? The Media Summit from this year really =
had too many
> topics and we had to rush at the end. So either we stick to one day and I=
 have to be
> more strict with regards to the number of topics, or we expand to two day=
s, but keep it
> shorter (e.g. start at 10 AM, stop at 17 AM or earlier). Stopping earlier=
 also makes
> it possible to split off in smaller groups if there are specific issues (=
not directly
> part of the Summit) that people want to discuss.

I vote for 2 days. Leaving the evening for workgroups sounds like a great i=
dea.


>
> 3) When do we hold the summit? I.e. for a one-day summit do we pick May 2=
5 or 26? For a
> two-day summit that would be May 24-25 or 25-26. I suspect there may be w=
orkshops on the
> Wednesday (May 26), so keeping the Wednesday free might be better. Nice i=
s not the worst
> place to spend a day :-)

I vote for 24-25

>
> Regards,
>
>         Hans
>


--=20
Ricardo Ribalda

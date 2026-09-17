Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67863A9610
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 03:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617449; cv=pass; b=AxaoY3o0fMLPMN/ShBYyOKLzjOfQooIZYV9Tv2tAG7ZvIq1yXO3qAu4Xu7OXE0oITL7xjfNv73k9N/PSvWEM2whtAeRBDpcsX8/auh2pu/YxPfUwFd3vVp4rG818H/2WooDQyiqBqPNBoavt++sxrKu4gmTnBFq10UNa7TB5hq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617449; c=relaxed/simple;
	bh=n12DLW8RMTngJSHkWT3omveJWZDYhmk6BJdGtX+fIws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG+rxJDI54e1gUZpq93/u1lB7ObJP5KHZf2LSVs7Maizlo0uT/zI3jFOA8JWcEi3nofpXPlUbjwQvRMaE4DfkrBnJUNgFhiobOcYH1KSCy/k6E9EVPt+PRMqchC3WTrqKN2I+wKxCK5us/HTSgHG+LNTJ3ZkQBs7monlHAR/hFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYC4B+vE; arc=pass smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYC4B+vE"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-90e8598dda2so2003006d6.0
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 20:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789617447; cv=none;
        d=google.com; s=arc-20260327;
        b=FB/si+XNuU621e5NEK5YrcnYL8bx61M8yLxsqAIQh4HFaaNrHWZKA7oKQ8BO1Dmd/A
         pGyE+J2a5BG4+11eiUBIVavoN+lAdw5B1XZ9GZBRL4xjXOs/JfNHv6QpqS2v35X19m1d
         hjQo9oBlnf6Oj61uk6D+/dka5jQl79xJUj1wjokh58Z5h+iWVGXW1u/uATHa5KVPcOyE
         YYb6A8JEtFaIfO13qRKIFyuv+b1UJpKMl8czWmIp2cGFdCn7jyqEsYe4sXs3Fc9t2nwa
         ggorLhPlR5DHEQVg9HwYde9YG3gRlGYR9XPtCnFwlaCOm8EFasFM3E6Ibo4AnyqlY9am
         G8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pnHh3hA1p4PwzbbICDxEFoaSVswO4U3C5V7fCjssYm4=;
        fh=eQiAJSQvkxi9+UKhY2o0RyltHcrepVz7EKKMc9v5gSo=;
        b=lmON42W+10l3hwj9Qb25hPjQVrGd8RGVrzLZPVbSzGjS+hCVoSs75XZ+5M2ZOCfwP/
         Tqao9NI+4H6zHhK+GuQMjp0HC/0fk17TP/QgOOWJ33R3gF42ek9tgUeHSguFb3KiXonh
         tyIaQZ6v/dENzJCZzsgfepaK0Te2Rq+sBoDmdgOWDFsH/xiOk0J6p4bDTJ9Jl5zN+RGP
         kqXQWRFghDwYNVwQzMXaT0wZIN/4hX3JpziIus7Ea8zmH4mTgILhLsp6KKttbGdVqJ8q
         S5nBEatXWwo3RMHjDfBrJm6jRdiNjAA6yzeqNgk6QR15vUU3ZTaD7A175H0ySE3E+4sT
         2ABQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617447; x=1790222247; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnHh3hA1p4PwzbbICDxEFoaSVswO4U3C5V7fCjssYm4=;
        b=SYC4B+vE1/J9b4UGm28gqDs+0PzF8F2ioDUOeOsAQXcBrJTYCHvzm2pGQ8BsoAdkOi
         JkH/tJBOP3edO2blbcAb0dmYZZAKC0pnpOuWBwZJzYeDWK6c1IOQRwSHKhTe4NdB4t9y
         chfeNaCKym2UFGPaLof1gMmeWbtq0n3a9UkcIV27fJnVeT6WbxxaX7zDLqQBRbz2lEtd
         63g2EcD49VwvW7gU1uZlZDqZz6lG/EHM3IDBQVn5XajRUHPetfIuo8gqB7DcSBR8oLpK
         T5MiNdryOH5PgcHy3LtvzX0EXbBVczTw37QYgWHSjXBsfpLf5fSS9cbNNINet1a2bNzo
         fRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617447; x=1790222247;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnHh3hA1p4PwzbbICDxEFoaSVswO4U3C5V7fCjssYm4=;
        b=sYYv4UtEmtwT9F32yrIMdqE/gLcW5Vb+P3LN1aw4XFI5cJBoEha75gZ2WQSK2cqUKC
         smF1tCZoDrd1Y+U7prKdN4MTyVgi6Gbg59oadOrGT3wYZl88jCSO8xt7KAyiTD5sE8NS
         +SafxqknmnGR8MHVtQZPC17BPhWh5SvnjVw5w/U03h/U/SPd0Fbr5rf1k8PPcVmoVjUL
         rDVTuJzgRta25xRnxcDhb1kOJzt8UPkLB8rTOd0/xvJJj5mms3JwA5rozCCwRmxx/L6u
         FT19tbGPW8F44qNTG/FaUabMDyQcYugt5/M5f135R46M3xfK7NFaan8ku9tBCO1Jy5cj
         svbQ==
X-Gm-Message-State: AFuF++lWUZdC0eveRDLuKyvnDX47+W0ALAfakCBTktpMPEBXQjzT0rbo
	byjPfmYvI0leeRXTzV4j5zgz2WCgozuWZGBSCjfQTkJEe6V9ejkD0OaYL6kPA9nlYdRzYYTYyQo
	NBkBf0W8SG7wFtUtUfa6aETA78Yk2jMy9ir+mXOgzlw3q
X-Gm-Gg: AYBFou1HgGT9TuKgPa9mwWEXySY+pq+CCPKnyrz0ufB4abPqd5gYcRgNvhwCnVrxQr6
	rvLWeLgSGFByL31WkiGXlO6clHJ5ne5SuVQFSp8iEOEgO92JVnoSLHTPA5o1ds53iqN0cf3bMDc
	Dld+2HnGLZbUhQNPhlITGd705AbPLTMsjScmJ4VPZLrQDG4rvpWwc7HgmCqX2+qfoffdXO3g8D8
	TtKP/XITmv/S4QMzfoy6DXts9NFMD1ZRmimujtFpP/aAgUWx0iP81YR3bxjQzUeiwixnCvGDGd0
	AAOcNKTqXied7VJCaZ+PzISJsQRS4OH9J2PKT/vQPJ2pYAIdb+EsgyuZJVD3Ck+1E0iO4VKhEty
	GocO9EncgFDzwEjhH1J0ybacIaGPPo9/bjmuPyiub6x2+4ZFLUVl84NYqjvFq9+OnnQWzQA==
X-Received: by 2002:a05:6214:21c6:b0:90e:975c:7805 with SMTP id
 6a1803df08f44-9123d7b3106mr97475256d6.20.1789617446581; Wed, 16 Sep 2026
 20:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHzb5FFF3C12pCWa0kdDGv8FRPeZJ5+wevz7Lvyd+AzGK7MBug@mail.gmail.com>
 CAHzb5FFF3C12pCWa0kdDGv8FRPeZJ5+wevz7Lvyd+AzGK7MBug@mail.gmail.com <6aab61c7.bf709f93.10ffde.666a.GMR@mx.google.com>
In-Reply-To: <6aab61c7.bf709f93.10ffde.666a.GMR@mx.google.com>
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Thu, 17 Sep 2026 09:27:09 +0530
X-Gm-Features: AcwNN1UqoE_7aNr-fAtX-jbw8fPATjbz8K6PaznWXWj3dI7wp0lpUOzXGfXEQS4
Message-ID: <CAHzb5FFOhxB7=zTug=VFE2qSNa7u-EU-bLHL8bH4nuk=_Spvuw@mail.gmail.com>
Subject: Re: Delivery Status Notification (Failure)
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
Content-Type: multipart/mixed; boundary="000000000000301536065ba5c89f"

--000000000000301536065ba5c89f
Content-Type: multipart/related; boundary="000000000000301535065ba5c89e"

--000000000000301535065ba5c89e
Content-Type: multipart/alternative; boundary="000000000000301534065ba5c89d"

--000000000000301534065ba5c89d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[PATCH v3] media: v4l2-ctrls: do nothing if controls[0] =3D=3D NULL in clus=
ter
functions

On Thu, Sep 17, 2026 at 9:13=E2=80=AFAM Mail Delivery Subsystem <
mailer-daemon@googlemail.com> wrote:

> [image: Error Icon]
> Address not found
> Your message wasn't delivered to *linux-media@vger.kernelorg* because the
> domain vger.kernelorg couldn't be found. Check for typos or unnecessary
> spaces and try again.
> LEARN MORE <https://support.google.com/mail/?p=3DBadRcptDomain>
> The response was:
>
> DNS Error: DNS type 'mx' lookup of vger.kernelorg responded with code
> NXDOMAIN Domain name not found: vger.kernelorg For more information, go t=
o
> https://support.google.com/mail/?p=3DBadRcptDomain
>

--000000000000301534065ba5c89d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[PATCH v3] media: v4l2-ctrls: do nothing if controls[0] =
=3D=3D NULL in cluster functions</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 17, 2026 =
at 9:13=E2=80=AFAM Mail Delivery Subsystem &lt;<a href=3D"mailto:mailer-dae=
mon@googlemail.com">mailer-daemon@googlemail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-386057630=
602038876">




<div>
<table cellpadding=3D"0" cellspacing=3D"0" style=3D"padding-top:32px;backgr=
ound-color:rgb(255,255,255)"><tbody>
<tr><td>
<table cellpadding=3D"0" cellspacing=3D"0"><tbody>
<tr><td style=3D"max-width:560px;padding:24px 24px 32px;background-color:rg=
b(250,250,250);border:1px solid rgb(224,224,224);border-radius:2px">
<img style=3D"padding: 0px 24px 16px 0px; float: left;" width=3D"72" height=
=3D"72" alt=3D"Error Icon" src=3D"cid:ii_1a0ad818c16d3f2f3341">
<table style=3D"min-width:272px;padding-top:8px"><tbody>
<tr><td><h2 style=3D"font-size:20px;color:rgb(33,33,33);font-weight:bold;ma=
rgin:0px">
Address not found
</h2></td></tr>
<tr><td style=3D"padding-top:20px;color:rgb(117,117,117);font-size:16px;fon=
t-weight:normal;text-align:left">
Your message wasn&#39;t delivered to <a style=3D"color:rgb(33,33,33);text-d=
ecoration:none"><b>linux-media@vger.kernelorg</b></a> because the domain vg=
er.kernelorg couldn&#39;t be found. Check for typos or unnecessary spaces a=
nd try again.
</td></tr>
<tr><td style=3D"padding-top:24px;color:rgb(66,133,244);font-size:14px;font=
-weight:bold;text-align:left">
<a style=3D"text-decoration:none" href=3D"https://support.google.com/mail/?=
p=3DBadRcptDomain" target=3D"_blank">LEARN MORE</a>
</td></tr>
</tbody></table>
</td></tr>
</tbody></table>
</td></tr>
<tr style=3D"border:medium;background-color:rgb(255,255,255);font-size:12.8=
px;width:90%">
<td align=3D"left" style=3D"padding:48px 10px">
The response was:<br>
<p style=3D"font-family:monospace">
DNS Error: DNS type &#39;mx&#39; lookup of vger.kernelorg responded with co=
de NXDOMAIN
Domain name not found: vger.kernelorg For more information, go to <a href=
=3D"https://support.google.com/mail/?p=3DBadRcptDomain" target=3D"_blank">h=
ttps://support.google.com/mail/?p=3DBadRcptDomain</a>
</p>
</td>
</tr>
</tbody></table>
</div>

</div></blockquote></div>

--000000000000301534065ba5c89d--
--000000000000301535065ba5c89e
Content-Type: image/png; name="icon.png"
Content-Disposition: inline; filename="icon.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_1a0ad818c16d3f2f3341>
X-Attachment-Id: ii_1a0ad818c16d3f2f3341

iVBORw0KGgoAAAANSUhEUgAAAJAAAACQCAYAAADnRuK4AAAACXBIWXMAABYlAAAWJQFJUiTwAAAA
GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABTdJREFUeNrsnD9sFEcUh5+PRMqZ
yA0SPhAUQAQFUkyTgiBASARo6QApqVIkfdxGFJFSgGhJAUIiBaQB0ZIOKVCkwUgURjIg2fxL4kS+
YDvkbC/388bi8N16Z4/d7J/5PsniuD3fyePP772ZeTsDQRAYQL/UGAJAIEAgQCBAIAAEAgQCBAIE
AkAgyJT3Mv+Eq7vYK8mTE+MDRCAghQECAeRQA5V2ZOpmg5vDx3NPzRbmGRMEcmTrEbNNB8zWfRD+
f/Efs2e3zCZvMjaksBg27TfbcuSNPEKP9ZyuAQKtHX2O9ncNgWC57umMPKvRNb0GEKgnLoUyxTQC
rcns0/6uIRAs8/hGf9cQCJZpTpjdO2f25/03z+mxntM1eLtsZAgiUtX4JcaBCAQIBAgECARQ8CJa
G5jab4J4pm4WZmO3OALVh802fIwcLkyPkcKAGggAgQCBAIEAgQCBABAIEAjKA/1AnahhbO5FdOOY
VsrrDbPBYcYKgf5D2wLaV3p+22xh1u17tO3S+DTcvxvagUDeivPgx/a/95J/73w7Sj26Hn4pKo2M
ehuV/KyBJM6d0f7k6RKx/R63vvL2tmf/ItDdM2ZTP6f7nkp9Y2fDx1v9akmpIU+KSCLVUghUQfSL
zVKeTklbLxGoctw/nzC5rw8L5KRNbkpnKq6pgSqEClzNnFzY+XnYWrt6VpVk1vbwWvg+RKCKMOUw
Q1LEOXA+/MX3mpJvGDHb265xtnzmFoUK1HaKQGlMtePYM+q2KKjXuaS1NJYIEKgI8jhEgqHt4cqy
Ky53j3hyHz2bqSLp2o2LbJ7MxKovkGqXteoWpaOk96O9/yF/dF7NwlS36AuIQIBA5celQK4PIxBE
4LLzrtoLgaALdSy6CJRkWQCBPGLsTHznomZ9nszUECgJ2ml3WWHe+QVFNPSQx6UdZNtxr9pbEShN
eTTz8mQXHoHSlke7+Z+c9m6VGoHSkEfs/trLW3wQKApN1V3lGfnGu2Z6BFoLtYCs3GWBPAiUCLVh
/HoaeRCoT9R873KLM/IgUBfapnCpe5AHgXry4pf412ihEHkQqCdxd5VqrcezhUIESsJMTJ+Pdthp
Z0WgyNlXXPHc2Mc4IVAELl2Gnh8mhUDvCkfbIVAkcbf/aOoO3fMKhqAD3frTa4quwpn0hUDOkQhI
YYBAgECAQAAU0QlYObl+5Ug8NcprZkZxjUCxRPVA6zmtEXHCBykskrhjgHXN09PoEcgFl4M4H11j
nBAoApcj6ZoPGScEAgTKApcDoTw5sgWB+sGlz1n90IBAPdE6j1o21PfcC11jLagL1oFWRyGlKU3p
OxcSJQ7NZAjkhHp/uG2HFAYIBAgECASAQIBAgECAQAAIBOkxEARBtp9wdVfAMOfIifEBIhCQwgCB
ABAI0oV2jhxZ+nfBatuPZfgBCy0Eqqo8c01b+uu51XZvzOgDWoHNTGR+pCwpLEd5svuAZXlO2uEr
PyEQ8hRWHgRCHmqg0sjTnLalv6crJQ8C/U8stqNO0I4+VZOHFIY8COS1PGL2ybd5yUMKK7s8zYmL
dujyd3n+nESgcsvzZd4/KwIhDwIhT35QA6UyE1qyxZnfvJMHgdKS549JC1qvvJOHFIY8CFR5eV5O
XimqPAhUdHnmfx+zgxdOFXkoqIGKKs/cswnb/8Oeog8HEai48nxUhiFBIORBIOShBioskkbySCLk
IQIhDwIhj28p7FApR6b1qlEbHGpkO/rr6215vi/zH1r2x7tApSGFAQIBAgECAQIBIBAgECAQIBBA
LK8FGADCTxYrr+EVJgAAAABJRU5ErkJggg==
--000000000000301535065ba5c89e--
--000000000000301536065ba5c89f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-media-v4l2-ctrls-do-nothing-if-controls-0-is-NULL-in.patch"
Content-Disposition: attachment; 
	filename="0001-media-v4l2-ctrls-do-nothing-if-controls-0-is-NULL-in.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu4zzc7f1>
X-Attachment-Id: f_mu4zzc7f1

RnJvbTogUm9oaW50aGFuIDxyb2tpbnRoYW5wMDNAZ21haWwuY29tPgpTdWJqZWN0OiBbUEFUQ0gg
djNdIG1lZGlhOiB2NGwyLWN0cmxzOiBkbyBub3RoaW5nIGlmIGNvbnRyb2xzWzBdID09IE5VTEwg
aW4gY2x1c3RlciBmdW5jdGlvbnMKRGF0ZTogRnJpLCAxMSBTZXAgMjAyNiAxODo1NTowMCArMDUz
MAoKVGhlIFY0TDIgY29udHJvbCBmcmFtZXdvcmsgaXMgZGVzaWduZWQgdG8gYWxsb3cgZHJpdmVy
cyB0byBpbnN0YW50aWF0ZQpjb250cm9scyBhbmQgY2x1c3RlcnMgd2l0aG91dCBjaGVja2luZyBm
b3IgZXJyb3JzIGFmdGVyIGVhY2ggY2FsbCwKY2hlY2tpbmcgaGRsLT5lcnJvciBvbmx5IG9uY2Ug
YXQgdGhlIGVuZC4KCkhvd2V2ZXIsIGlmIGFsbG9jYXRpbmcgdGhlIG1hc3RlciBjb250cm9sIChj
b250cm9sc1swXSkgZmFpbHMsIGUuZy4gZHVlIHRvCm1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUs
IHY0bDJfY3RybF9jbHVzdGVyKCkgdHJpZ2dlcnMgYSBXQVJOSU5HOgogIG5jb250cm9scyA9PSAw
IHx8IGNvbnRyb2xzWzBdID09IE5VTEwKICBXQVJOSU5HOiBkcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWN0cmxzLWNvcmUuYzoyNTI1IGF0IHY0bDJfY3RybF9jbHVzdGVyCgpBZGRpdGlvbmFs
bHksIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIoKSBhdHRlbXB0cyB0byBkZXJlZmVyZW5jZQptYXN0
ZXItPm1pbmltdW0gd2l0aG91dCBjaGVja2luZyBpZiBjb250cm9sc1swXSBpcyBOVUxMLCBsZWFk
aW5nIHRvIGEKTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gbWFzdGVyIGNvbnRyb2wgY3Jl
YXRpb24gZmFpbHMuCgpVcGRhdGUgYm90aCB2NGwyX2N0cmxfY2x1c3RlcigpIGFuZCB2NGwyX2N0
cmxfYXV0b19jbHVzdGVyKCkgdG8gc2lsZW50bHkKcmV0dXJuIGlmIGNvbnRyb2xzWzBdIGlzIE5V
TEwsIHByZXNlcnZpbmcgdGhlIGRlc2lnbiB0aGF0IGNvbnRyb2wKY3JlYXRpb24gZXJyb3JzIGFy
ZSBjYXVnaHQgYXQgdGhlIGVuZCB3aGVuIHRoZSBkcml2ZXIgY2hlY2tzIGhkbC0+ZXJyb3IuCkFs
c28gdXBkYXRlIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24gaW4gaW5jbHVkZS9tZWRpYS92NGwyLWN0
cmxzLmguCgpGaXhlczogNzFjNjg5ZGMyZTczICgibWVkaWE6IHY0bDItY3RybHM6IHNwbGl0IHVw
IGludG8gZm91ciBzb3VyY2UgZmlsZXMiKQpSZXBvcnRlZC1ieTogc3l6Ym90K2NmODk2ZGUzNjE0
NDM5MWJjZGUxQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KQ2xvc2VzOiBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9Y2Y4OTZkZTM2MTQ0MzkxYmNkZTEKU3VnZ2VzdGVk
LWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJv
aGludGhhbiA8cm9raW50aGFucDAzQGdtYWlsLmNvbT4KLS0tCnYyIC0+IHYzOgotIEZpeCB0aGUg
aXNzdWUgaW4gdGhlIFY0TDIgY29yZSAodjRsMi1jdHJscy1jb3JlLmMpIGluc3RlYWQgb2YgaGFj
a3JmLAogIGFzIHN1Z2dlc3RlZCBieSBIYW5zIFZlcmt1aWwuCi0gUmV0dXJuIGVhcmx5IGlmIGNv
bnRyb2xzWzBdID09IE5VTEwgaW4gYm90aCB2NGwyX2N0cmxfY2x1c3RlcigpIGFuZAogIHY0bDJf
Y3RybF9hdXRvX2NsdXN0ZXIoKS4KLSBVcGRhdGUgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBpbiBp
bmNsdWRlL21lZGlhL3Y0bDItY3RybHMuaC4KLSBSZXZlcnQgaGFja3JmIGRyaXZlciBjaGFuZ2Vz
LgoKdjEgLT4gdjI6Ci0gQ29ycmVjdGVkIGNvbW1pdCBoYXNoIGluIEZpeGVzIHRhZy4KCiBkcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWN0cmxzLWNvcmUuYyB8IDE2ICsrKysrKysrKysrKy0t
LS0KIGluY2x1ZGUvbWVkaWEvdjRsMi1jdHJscy5oICAgICAgICAgICAgICAgIHwgIDQgKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItY3RybHMtY29yZS5jIGIvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmMKLS0tIGEvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1jdHJscy1jb3JlLmMKQEAgLTI0OTAsNyArMjQ5MCwxMCBAQCB2b2lkIHY0bDJfY3RybF9j
bHVzdGVyKHVuc2lnbmVkIG5jb250cm9scywgc3RydWN0IHY0bDJfY3RybCAqKmNvbnRyb2xzKQog
CWludCBpOwogCiAJLyogVGhlIGZpcnN0IGNvbnRyb2wgaXMgdGhlIG1hc3RlciBjb250cm9sIGFu
ZCBpdCBtdXN0IG5vdCBiZSBOVUxMICovCi0JaWYgKFdBUk5fT04obmNvbnRyb2xzID09IDAgfHwg
Y29udHJvbHNbMF0gPT0gTlVMTCkpCisJaWYgKFdBUk5fT04obmNvbnRyb2xzID09IDApKQorCQly
ZXR1cm47CisKKwlpZiAoIWNvbnRyb2xzWzBdKQogCQlyZXR1cm47CiAKIAlmb3IgKGkgPSAwOyBp
IDwgbmNvbnRyb2xzOyBpKyspIHsKQEAgLTI1MDgsMTIgKzI1MTEsMTcgQEAgRVhQT1JUX1NZTUJP
TCh2NGwyX2N0cmxfY2x1c3Rlcik7CiB2b2lkIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIodW5zaWdu
ZWQgbmNvbnRyb2xzLCBzdHJ1Y3QgdjRsMl9jdHJsICoqY29udHJvbHMsCiAJCQkgICAgdTggbWFu
dWFsX3ZhbCwgYm9vbCBzZXRfdm9sYXRpbGUpCiB7Ci0Jc3RydWN0IHY0bDJfY3RybCAqbWFzdGVy
ID0gY29udHJvbHNbMF07CisJc3RydWN0IHY0bDJfY3RybCAqbWFzdGVyOwogCXUzMiBmbGFnID0g
MDsKIAlpbnQgaTsKIAorCWlmIChXQVJOX09OKG5jb250cm9scyA8PSAxKSkKKwkJcmV0dXJuOwor
CisJaWYgKCFjb250cm9sc1swXSkKKwkJcmV0dXJuOworCisJbWFzdGVyID0gY29udHJvbHNbMF07
CiAJdjRsMl9jdHJsX2NsdXN0ZXIobmNvbnRyb2xzLCBjb250cm9scyk7Ci0JV0FSTl9PTihuY29u
dHJvbHMgPD0gMSk7CiAJV0FSTl9PTihtYW51YWxfdmFsIDwgbWFzdGVyLT5taW5pbXVtIHx8IG1h
bnVhbF92YWwgPiBtYXN0ZXItPm1heGltdW0pOwogCVdBUk5fT04oc2V0X3ZvbGF0aWxlICYmICFo
YXNfb3AobWFzdGVyLCBnX3ZvbGF0aWxlX2N0cmwpKTsKIAltYXN0ZXItPmlzX2F1dG8gPSB0cnVl
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tZWRpYS92NGwyLWN0cmxzLmggYi9pbmNsdWRlL21lZGlh
L3Y0bDItY3RybHMuaAotLS0gYS9pbmNsdWRlL21lZGlhL3Y0bDItY3RybHMuaAorKysgYi9pbmNs
dWRlL21lZGlhL3Y0bDItY3RybHMuaApAQCAtODM0LDYgKzgzNCw4IEBAIHN0cnVjdCB2NGwyX2N0
cmxfY29uZmlnIHsKICAqCiAgKiBAbmNvbnRyb2xzOglUaGUgbnVtYmVyIG9mIGNvbnRyb2xzIGlu
IHRoaXMgY2x1c3Rlci4KICAqIEBjb250cm9sczoJVGhlIGNsdXN0ZXIgY29udHJvbCBhcnJheSBv
ZiBzaXplIEBuY29udHJvbHMuCisgKgorICogSWYgY29udHJvbHNbMF0gaXMgTlVMTCwgdGhlbiB0
aGlzIGZ1bmN0aW9uIGRvZXMgbm90aGluZyBhbmQganVzdCByZXR1cm5zLgogICovCiB2b2lkIHY0
bDJfY3RybF9jbHVzdGVyKHVuc2lnbmVkIGludCBuY29udHJvbHMsIHN0cnVjdCB2NGwyX2N0cmwg
Kipjb250cm9scyk7CiAKQEAgLTg2OCw2ICs4NzAsOCBAQCB2b2lkIHY0bDJfY3RybF9jbHVzdGVy
KHVuc2lnbmVkIGludCBuY29udHJvbHMsIHN0cnVjdCB2NGwyX2N0cmwgKipjb250cm9scyk7CiAg
KiBJbiBhZGRpdGlvbiwgdGhpcyBmdW5jdGlvbiB3aWxsIHNldCB0aGUgJVY0TDJfQ1RSTF9GTEFH
X1VQREFURSBmbGFnCiAgKiBvbiB0aGUgYXV0b2ZvbyBjb250cm9sIGFuZCAlVjRMMl9DVFJMX0ZM
QUdfSU5BQ1RJVkUgb24gdGhlIGZvbyBjb250cm9sKHMpCiAgKiBpZiBhdXRvZm9vIGlzIGluIGF1
dG8gbW9kZS4KKyAqCisgKiBJZiBjb250cm9sc1swXSBpcyBOVUxMLCB0aGVuIHRoaXMgZnVuY3Rp
b24gZG9lcyBub3RoaW5nIGFuZCBqdXN0IHJldHVybnMuCiAgKi8KIHZvaWQgdjRsMl9jdHJsX2F1
dG9fY2x1c3Rlcih1bnNpZ25lZCBpbnQgbmNvbnRyb2xzLAogCQkJICAgIHN0cnVjdCB2NGwyX2N0
cmwgKipjb250cm9scywKLS0gCg==
--000000000000301536065ba5c89f--

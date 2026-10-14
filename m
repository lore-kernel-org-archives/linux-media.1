Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CD468C02
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960564; cv=pass; b=uQIo2r5vKIkAJ3ZNYLhZWA6QHlaZnYoeFM4CW4YKk4+qs8eqdW27EZkeJrhHv4ej3nyp0FHPrXSzYEeTNyEdqTfHWOZRRHAFGOf76NAR9NrQsMM6YqGc2cex+sXPlZdxLv9kbrr2TJAfD46UDOFA96jukjq6rCLeVy5teTZYwLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960564; c=relaxed/simple;
	bh=aQp8oRIAczotXzqSiIFfwp9CnFohJGLCpjPmm7TR0FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUxyv+WYDLVu11qD4g6lj9ydyp2Cy4RDec7+OfWO1IiIrFiewq9dy9Ir+qQnFMNGCmCjmzBKZ85VABIbHRPb0ACi27QLnyrzspn0SmBSFjik3KTdYDAyYzAAgzNsTKphBxwsA21T6Tjcj0XluWm8UV/FI/uPNp8ERpLDysFeaTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWjG486G; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWjG486G"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso34493a12.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 23:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791960561; cv=none;
        d=google.com; s=arc-20260327;
        b=j/la+FmVOzHWEzbTq5V+80FPgoIQ6au/ix/saHZhXZciGGqNvigPLI/58R35aZcfa+
         EVjrqoKEPmUu6IJvV4xFGeWdZp8T7HhBeo/iVKcYStCuQL22uW+Cn9iAYd9/WT51W+IB
         arknLdgZqO0qNrz5qviXA/3Rfsi4uNQztf4FpZMCFJpgBSkzsu5Ijy84hJnYE5XMem0/
         8RTugtxY1mJXd5mB65QoL5HjOKpRi1OiS4McC2vOJYSqd2AkZqH7bwnFhzkwKNhA8ST3
         8xP4PhzkgE20K6H8Nw5v8B0MD3HErRf2vlQm/V8fzY/xqrxnlq1y2QpN+0CbZV+xFxKJ
         QIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        fh=WTs9hwGqflkUD0Yg0zo8VUBAMLLdECsibF2rLaC0+y4=;
        b=doZ+lvi7Q94IU9Q80BUm3BI0gVj0qQjyNNV72D6zJuxfiEP6Z0ZuRpULIuKtHDBeko
         U0OFEtg5/R953CGzECYwfRtJBm500RzqdS6NzZuPadqSOA4SN7hjmdqsjAOWOGPFVK1J
         f92zeFRSwo9Kj+B53jaGmC6icGNJUnY4QAyG745gaThhXjtidszbaYT/naEmFSXvZK5M
         oSomsYJQtU5DoXtfTmM/DxUJxpJS5UTosSCj+1+OqqQRe+cuDYF5/dfykRmH1JF+oNIk
         BtdphBJiJOYJyvGGqdUcpl8my76cnDOJo3xzxd/F1wF7JdzWzhXvH+6ZfDToPvZtZWUD
         mwSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791960561; x=1792565361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        b=FWjG486GXpUj3e0LVRi171FwusyIn1i2DWnpGEyaMq+NBB3vJ7TXGW8YOo4NESEwKH
         NnM8/VstPFYQSSmxXk29eryt8gJqYU7TcvpCjQHIp5nDdbtVNS8z4nN2qQuLVMLjBJEe
         RftBCs5N5t9gTiQD/x4Pfz1y2tsTVVhME9abr0Ojz/5zinIIM1chaolYT1Knnq5W8kin
         XoSl/Svo2qYyKhi4qM6NGqhWgXHB15Vf83Y7CYbzwtLQQILvrZ03BoYIQcv8ndJSfTDu
         dN7prpwJxctDbR7LNdkOyzJMxx8k72dE4q8d0BUxi9tSu1CDcWkJ+kQyMwWOqjmqrmgL
         tFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960561; x=1792565361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        b=ZC5nCpVrps2qgHkZ1qqUyAB+8+YvCvrdUFiqD6xdTQ9C48oGv+2AHRT7UULtiFew1k
         IKzGjx19ZdznpcUdOQkMclhxNvN4tLIGlh4yC828yEvT4ffNwSAPeEqj6NfCakeO+AgG
         cipT2AA+MNZLlC5cD7LjIReXPau5gDVqUt6j9ji58WO8xKxr22eKwufJSjx85ZD/rWQR
         /oQxpFhx9Of7xsbVnmkE0uJ7JQCVebJUDO5lpg5g4N7XcaZrYGGWu8tdmDw+FJz9RJIU
         TCVdh0YNBPMydmgRpCHQ91WoH6wL2swvZ+evWJxdZ67XUJsrQUgc9jQlcuEUM1mHY/lW
         CVFg==
X-Forwarded-Encrypted: i=1; AKwUvBwiFA8NbJiU9EwljmxrsX9/vmtASLEVQLdsD1bWaJyIbFMREv4yZ/EIg2AtfDrSA2mzWuVn8fn2zeWWsg==@vger.kernel.org
X-Gm-Message-State: AFq9FYILVT5X+2o3brIPDwyWE2m2rXogCP942H1wTzoug118FNQ63I0e
	ktJJ+BEZmdz0C4anjc7vQWpfHdkqYivJpbdJLLiKIqgYL5F0rAhNhy87uwdfHncQjJF9PRz2hMv
	u7FdXjFKTQnfeY8jdB1vTRMbDE9DOyVf7FPjwCh2X
X-Gm-Gg: AYBFou39mZw0uDZk8VomXEK7mggHDW2ozQLtRvOmtvbk//5PO1UIOTDh/ccxOnHxzPX
	x7hbOGcNz4efPOkbn1w1plqd3kXmIfFBMOC5g7qcXFqMdTdDKzJKSZVOhqv9Ew9uUeBTwlf6iKT
	J3mQR+UEqRSzNj3yeYYXYeJYBeSPHQXJuTk2mf3wAr82V9buqsd/E5o9XOFw5U3ipucKngbdCtH
	WeB+66gT2aRy+oQs37RiimL40VoT4rivMVbvMsREQ/gz5X62N1eLR4+j52AAID/fTttfirzZCNn
	T58yyuOOiAzZsHiK8Re+rjWa8Eeaojy3/v3HVlOY85g7IdZrEk5EDvLhXU2b5fcG
X-Received: by 2002:a05:6402:683:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b20ab049f4mr17118a12.14.1791960560065; Tue, 13 Oct 2026
 23:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012174300.2338784-2-almasrymina@google.com> <179191526299.434549.7888465945343049764@kernel.org>
In-Reply-To: <179191526299.434549.7888465945343049764@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Oct 2026 23:49:07 -0700
X-Gm-Features: AclHuK_pUGXFUw5Tdds7zQVYPdcRbxQWbgDPdlpfKDTpq7eymZUOA6XtUrz1B90
Message-ID: <CAHS8izOppdgVxeHrUpR6zVxfdTHw1Bv4JEoYGYGodAjyijB+ZA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, dw@davidwei.uk, asml.silence@gmail.com, 
	ap420073@gmail.com, sdf@fomichev.me, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, razor@blackwall.org, 
	daniel@iogearbox.net, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:14=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 0 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The same dma_unmap_sg_attrs() slab-use-after-free the patch
>   claims to fix can still happen for RX bindings made on a virtual=E2=80=
=A6
> - [High] net_devmem_dev_unregister_rx() adds a new writer of binding->dev
>   (and a new unmap).
>

For both of these, they're issues with leased devices AFAIU. My LLM
found just too many issues with the leased devices. I'm hoping to have
this series merged to fix the lifetime/revoke issues with the physical
devices binding->dev =3D=3D binding->vdev, and rework how the leasted
devices work properly in another series. It was just too much to fix
all the bugs in one go.

--=20
Thanks,
Mina

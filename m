Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3419314D13
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733891; cv=pass; b=HEUABp96zZegCFwa31HGGKXplDEiPt7sdb68C8GoRqIb7O7yqv+ABALUL6fWgjJg/I8vMhi+sEuRpXitkYQylBlO8D32UUvx0MNEcA7IvpDSQGHnPRpOBJ4RhlS4t6WsMtbp9ePVFOPBibK4IiKSZcv/UYVqYYofbzMZCHz+Bqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733891; c=relaxed/simple;
	bh=IV3UF1ZbgbEHaaPEvCc2BzMnZwlILj8XNq4mL7GXZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/rHDe1TS1V/BvO1rhsKmM/EcHdUlvQD6Wp42kFPwHS730gR1TdrbhRECOJd0hiUkINWmM/CWNSsAq6i16ED5VGmPSuB4WGpqFz2J8bqR05MT6z4LmtkmmpvMYMDcvGR0LMJQdicEzcxuZqDbKViqNGvDVVv/Q7eyX0W3s4Pie0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhlTg/q1; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhlTg/q1"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-169be2dfbacso1789c88.0
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 08:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733889; cv=none;
        d=google.com; s=arc-20260327;
        b=FIgZxn8Vupjya5Pz28h6vz+EBMBufj6jIk559UgJpLtdK3kCYdPWOYjezi2o19YRUf
         mfoOQXJk9eHIDJBpINaZBfcAt7ELriYcRr4BohKDos5xv4NV6cf7G8EnzanaepVK3r2J
         0JBoGkcouqLP+eOzP2csP30guICV8BJJdOtJTRbTdCLBhUyM5lXS+3xcku6anR+7N6ec
         rUoSk2k+WqnSL++R7MGgrb1Mrf3ll4bt5ORLB6vnnZjsdB6ZeMh1HsXzBsM7DuUiBD9s
         Uw3mBcalbWwoEfhLqT/DrOG2NCtrZ7kAST2I0S7tGs2SaHn3eNdEBVww/Bt7ispzTKeC
         h/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        fh=vQye2JqS34diEFTetP4bgdusw+t5FjyLifEvbEsw6PQ=;
        b=qweGHYC5/O0cmtOXV/fC2kN+yvvgcNkGhZ94XY6UsBXlu513rI6LZw7HlxUs5mu8Q6
         a3WdCVQNYQkP0gaW8sX+LaT4v381iGFOBKoy97ANhMoTnciFcviwr4wY8LN7eEg+bi43
         gEzGT3Msx9GdLIbbJDfQMq45j+IjxDWd9SNg6qO2c9jF8qtsU/6ZIduojnO9hlokpxLv
         esN50mhSjuX516xESzJTpTJ3TdVBBcz2b9P1HIRQdCnVXEVO3gQ2LFH+UsE5J4mQhVVc
         8gcNzTc6xk/tvjgAiKfs6DQNZMHs66XxFqnN89Ersm1v3zBLgIN5C213wc7R0Ve7FbU+
         TpuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791733889; x=1792338689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        b=EhlTg/q1JI8aymjKR6w5G8AsCiAK462hNBGQEStU9+bv8njp/0Vjl9cY74RmLQ7eIs
         2zPLm+9r7RnXfMSMi9cZJE7V/i01PiJ+UUWl3THnXs9MgeAevQbrTdto7l3smmL+d2pN
         CbmQVWLR3im2KSzIb6YID0GGIa2J3SiN96vHWrr3eH9uIoG6Q7TesSlm4h61HWZ/46ZE
         BZlaECHRHFSGe2jQZ8Ox0au6B24Vjwhx9852w8hHfydnD4P2ndvEdKVOcH7OgpbXDgH0
         HtakzC/K7ZUlVXkdWoeHLG3/83WjWFShF8utZ0lE3w62m4KxkkzZGt8O8WRpLVqyNkPX
         fUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733889; x=1792338689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        b=jOhhAJ572WkNfjHJOnVDwX/YOcA7yUuhLFY+2n9Ou117Qg7xYakTz6syKZf3OrMWdl
         gNutQ/HQRuatMeAblD4J9pT/OO9UOy8k6wzoBYO0ezqMhRwdLI4O8W3AO3kGrK9jXRjQ
         vbNCVQrIfttVldGIwea1iKVadydcxhZo6LpAefg2oo98dRyXoyy0SgPHlwppS74b5M7z
         TY5Ae+ar3NWAicIcqhhpRwOdyxMTKEpGaFTf8CUyFzvUoyx0mrDGnVHOGehDcURxgBw/
         /dNL6bzmvoJNthEsAIriYm05AFMqhnr2ok8E1hPQC6I1T78x4qM+54wOtbrqPJbWwCAG
         me3Q==
X-Forwarded-Encrypted: i=1; AKwUvByXUArd8bcfDSZJcBASPgF0iAz9MpdRUgrLO8smR7kAMxDIP5r40UW2Mdn6tqC3TtpxMeYlL4c8+PSb9g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIueNbco3hEyFKHjsS4r/5bAnB8/q2kYSdKKxA7dTM2oqGZlobr
	b6G441/fILGRy3+OA6mIBB2zMZ4tjS36RRIVBy9qz1YmV0XSIpHUaTIODMEMOc8jfJehgbseu3g
	5QcOcxVZ9/dP3OvMHva02uAu2NrMi1gJ3/ocmvzAR
X-Gm-Gg: AYBFou164GnWQbQaAtsFWGlB+ECo+O+NIYSFwkPRwMGz87pJTTVMkC1Ug7MADMLz9tY
	+7tI9X00zWYyZP4OB/AXeMoDz4/AkbEMmaQZ7frV1Sd8KdE0G4L0gqFqlkeREQv7iO3/SggPbxs
	/C2Fy4XvoZT4VtsPATnD43fVjA4ignnYAA6XqVDGdXp3MHDVpqMsI3gvstDE5QJqEAJr3m+Iv9G
	sX1bk4bMuCxDn/49kN3aUwCDr9m2i1MkWZJWR0JCffBAAjjClCTT1i27RnUnGnOnRFawDAs3tsE
	fSP5r7KB5dOREwNTRRIyksuLnO9eiUhl69WM5hh2aaz8ik9pmKIQcQ==
X-Received: by 2002:a05:701b:2506:b0:146:85b9:974c with SMTP id
 a92af1059eb24-16e81b7bcb1mr124139c88.18.1791733888132; Sun, 11 Oct 2026
 08:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010025532.839559-2-almasrymina@google.com> <179168989611.434549.16378879758158058625@kernel.org>
In-Reply-To: <179168989611.434549.16378879758158058625@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 08:51:12 -0700
X-Gm-Features: AclHuK930gGDDJHBRZhLwx30RqRng6RPlhHFuLPE0htp8kvWdbnGSu8mFAUgs1o
Message-ID: <CAHS8izNWaWF5-Zo=rqaUzC3joNkwoYnrxawUUVn73BJEaPSGFg@mail.gmail.com>
Subject: Re: [PATCH net v1 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, dw@davidwei.uk, asml.silence@gmail.com, 
	ap420073@gmail.com, sdf@fomichev.me, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@iogearbox.net, 
	razor@blackwall.org, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 8:38=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: a binding that has already been unbound (netlink
>   socket closed) but is still alive because a TCP socket or page pool=E2=
=80=A6
> - [High] The patch unmaps and detaches the dma-buf in
>   mp_dmabuf_devmem_uninstall() as soon as bound_rxqs becomes empty.
> - [Low] The comment on struct net_devmem_dmabuf_binding::lock in
>   net/core/devmem.h still reads '/* Protect dev */'.
> - [Low] The comment on struct net_devmem_dmabuf_binding::ref in
>   net/core/devmem.h still says 'The binding undos itself and unmaps the=
=E2=80=A6

The findings look legitimate.

pw-bot: cr

--=20
Thanks,
Mina

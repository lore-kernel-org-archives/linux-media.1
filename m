Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FCB49E5EF
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311620; cv=pass; b=dI/RxTkeZ4SVqORySk1gFt1xk6fZ2RegCeR7BwtmWhzDyOx8uGVVT0hKn+04vgaL+96X6UTvmx/7hqn4V2QGBwgOnSF4TLQkp2wrRSgrnueHRMR5MzE8s1gOa8FhodVDs7mwyjBUMgYUqicno7D+9ne8LNonwrUVXnuRuD5LJKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311620; c=relaxed/simple;
	bh=97oUKsO0e5chpZ77/TXNGzc+ViH4yet7xP4s2/riIOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iniWez4Ay9r2yCtnx9t97g+FhmYFE0nNmeVo4gUlCJB/2Yz4R+945Lzlun9Y+WBm9V0QYtKSWZtL5nH9dzIC3YQ1+A+kXSIrt6LKkNCZmYNPBE7J+4zPZXAkHGvOI4LE2FwPEVAMlJ4gZx5fr8wdYIX1zx6ECzE7lwFK5Izjaj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYNyzuGb; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYNyzuGb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3304593f8f.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 11:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791311617; cv=none;
        d=google.com; s=arc-20260327;
        b=QF9CzJN+nd+YYZdkvcmHfzfRCfeu6GlegAyfU9+uSVgymuxsp8diC2y7hiFKnnmvDz
         1m+4AOe8EYg3cqwT/LXd52LEOcKmocHn5bj6VNRMTrWn7NYG6o628eCm5KLbIu/7N5CP
         tF7ORwa1YRHY/MuAk4sjx1VcQB7GTqfKI2+7MKUzMNTJXWYXQ79fv0JdHxWMsUFS35Go
         Q2QWO1NVtFS89W2eqLhWuuJuuJtGdbPRHeKf0gOYFqon3mAkxPO5a6fCMfbHF4viB0lT
         VHD17qFTgcQ5H2YTMVyjuOfKnC+d/wA5WCOFDJvh/3Ub8oIpPm+snvAMKVYXzqaO3FmR
         RJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        fh=2ZwU1dhnqiaMboyYvqsWXmAHdEJzbav95M3Rgco7QAg=;
        b=Mta9npcGOqS0lHH+J/iKWcAkK2wIQ1OQPZPgZwV8WNrKFhZu2Lyq43u4/g3OSCsnRW
         gwcIBz3Mb1WwIXMwX/Uj8BZvgRxRcIPiy1MLSOBsDhGuDVrZZwNd/1KwV8niyRL3YJFe
         11LgbIYrPp5IjRXViFC7SkyhlrYcgyqfyrZvKSpYdRvrb3cFw6WNPoE6tP08NCEJKgCu
         GVfE+BVXkRuLpxil6c79qV/OQU6V8ir17iNGQn3hMuf3I3S+gpvm6H+cuqn5gtq0ygWZ
         H+xzAP433xisE0X+MGErIdrHBcUsm5K9gZsYyFhZHiQAt1pT/nG7zQnQbhssyCRPOTqF
         byKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791311617; x=1791916417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        b=gYNyzuGbEw8W4W3thlPUfhzcRnGusY6lf3EsyUAc/nJ8UnMCTdXApXgRl1ks+flh/R
         3nuifYo9GCF1zUtCvxZZbn/ndZY3BmFFEmzp5x/9O8pnunYO/T/DkyC4GO/qbjrUMm6u
         c1eZRWsydrqSm70+EmlkERII7S02TvFh5QEX7fuNcvIGNeFtjruIG7pr9d4WWeP2NVTM
         iyZp5F/3YskowHayAhhd0xicqdv6zQxv6HMYk4qVL0bi6lPgR31v8xShbf0XMpTkdH6y
         BC/4NEb76i122EwS/3DyjXwI3ghwDzL27WXpirH3bOjllOCnjF5lNPqAI0qhKmyxJj8W
         M3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791311617; x=1791916417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        b=eCr737h7aFzd19YYq/KTciodL1A1ZSIYkSREUpxu9di7EseD67MIOd4Eaam1Ck6SM9
         REcLuhGJ306weXvb2154T6KzijyXcqQl8ETZgDsIarf1MJn7Vai4s8GYsB1CzvuFhgII
         859GTUfpSoBD/vGoW6xIni6zca+gnnhJh/CGUuLvxlNVvc0RK6HnEk3ywQXx76q2shYV
         0ZzyuKWb8V7u8bzzy6VaWxPhYCNceyTdyY9FsG9xybzVk7tK9F2tcgG3+fZ7VqS7P2Q2
         pfdogAVX/8RSNlOmeAXf+jLRdyB3hK3hSP6CLp373G4KcjNFJRoVsgaRpu34RkH+coTy
         7JVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQhw2qxiWTlXtk3sBtH/97eXOv5MWguSSxfhF27ZkqapkvQATXOt37DtSchbk44LUFz7+/lO+kSqYaGQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdIKOx6mDokThK/RpciTr+6yDWYjLkIal7j3FZZH7AGpV96kFN
	goLBGO/plFEDl9pgxP+rxwhlbxSD6zVwQydW1ESpjdgH2lwwlltipumCeTrTHwah2syVB/llmM7
	FmU6hUrd9jkQTQkM++xLEFndq1nBIMGw=
X-Gm-Gg: AYBFou0HyUkT/89vu6AX5LfStlquILxs/0BhOoXRF+umvE89S84yaV56UTRQ3GcCCBe
	Y4GJGAz07ka/OCoAjAnEmBY7oRvuBJCKm41HuQxLRahQ1rxtUC8PTmB8FQv9pa35w4DLgGtDdAP
	zEox9ApowH011P2Ad18xlhhEzQp9C4BAvZC/qJ+RSIiryi76xGasFvd5maqFQV2WBMr3mp4A2GX
	yBSs7KIJudvry4mAptfkpVT0mq5xXL+3KQCtP5H1DYbAOtiIyHOpH3IOMh4GMMXXMgs09cJhfsJ
	lW/LtrgWhFyNdaQtMw2cVb7E+zKKQYx7oRxsCzwV9/GEPtrwe54WKQ89fTNT9lN0Bexy2G+m7uE
	pY2BYYMXA9phSsBE8/lqXr0N3ikf0t4DHD1F1l51KvNw=
X-Received: by 2002:a05:6000:208a:b0:487:1ac0:32af with SMTP id
 ffacd0b85a97d-48c728a7f51mr452023f8f.51.1791311616531; Tue, 06 Oct 2026
 11:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 19:33:09 +0100
X-Gm-Features: AclHuK-lHOnsjkuXOpvnCyKRYV7OYbDYDNgNdkGPQxNTBgQh6bjjlMS_ndycwy4
Message-ID: <CA+V-a8uam6zpuFoJURO+YuiYLeckAYvEAOpF5cZsH2buBsfLBg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Sep 28, 2026 at 1:33=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 637fc92dcc26..74b75be599ae 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>         };
>  };
>
> +&isp {
> +       status =3D "okay";
> +};
> +
> +&ivc {
> +       status =3D "okay";
> +};
> +
I was trying this on 20261006 as soon as I start camshark I get the
output below. Im using IMX708 sensor on the RZ/V2H EVK. Are there any
additional patches required for this to work (any sepcific version of
v4l-utils/libcamera) ?

192 login: [  196.846011] rcu: INFO: rcu_preempt detected stalls on CPUs/ta=
sks:
[  196.852193] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D1048
[  196.861489] rcu:     (detected by 2, t=3D5253 jiffies, g=3D5753, q=3D6 n=
cpus=3D4)
[  206.875392] rcu: rcu_preempt kthread timer wakeup didn't happen for
1254 jiffies! g5753 f0x0 RCU_GP_WAIT_FQS(5) ->state=3DI
[  206.886411] rcu:     Possible timer handling issue on cpu=3D2
timer-softirq=3D2740
[  206.893406] rcu: rcu_preempt kthread starved for 1255 jiffies!
g5753 f0x0 RCU_GP_WAIT_FQS(5) ->state=3DI ->cpu=3D2
[  206.903455] rcu:     Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
[  206.912616] rcu: RCU grace-period kthread stack dump:
[  206.918235] rcu: Stack dump where RCU GP kthread last ran:
[  178.982667] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  178.988821] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D3946
[  178.998117] rcu:     (detected by 2, t=3D22262 jiffies, g=3D5753, q=3D6 =
ncpus=3D4)
[  199.056986] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  199.063092] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D6596
[  199.072322] rcu:     (detected by 2, t=3D38018 jiffies, g=3D5753, q=3D69=
 ncpus=3D4)
[  176.177639] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  176.183749] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D9246
[  176.192984] rcu:     (detected by 2, t=3D53773 jiffies, g=3D5753, q=3D70=
 ncpus=3D4)


Cheers,
Prabhakar

>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640";
>
> --
> 2.55.0
>
>

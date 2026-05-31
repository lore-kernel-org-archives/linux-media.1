Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF3272E56
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235513; cv=none; b=hUvqYiP6s5jQhrdvPhtil5AQcHDIgUYZ9+Hfu0Y1pIYtn+XrAFy8bwmMe44R4PmanedSzbKShUPM5pHfKUl5nCqVw/RpVP31iBcvwOzMQaR+LZgpN6jwfvTg/X77+NAl+3bec5m8WOMQiDmn6ipKBv6ogcJmixw/XtvpXYCzqUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235513; c=relaxed/simple;
	bh=FUhzUHmBwHkwsNF0zRKLpz0nZPsSZRf1VVAi3lFB0gA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bN1Rn+MaKZcNA2NKY68u14r3TqGUE86GQ7SksJd/sI1N+0LJJW0Tvccw81uqEPYaO9gX6HaChtfXmc2YaXbbRi4qFzwvY7eoGPGwNM/RFnPYAiEfPUwqSgsQ8E/k+29kXkeLWZ854+tejq8AgG38SNEQPqrfEb+nDdgc7VRanEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZeRuBL1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZeRuBL1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2681F00893;
	Sun, 31 May 2026 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780235512;
	bh=4DffebrKL5rcxAycDsBKnZghzryNEb+7GMCeyk77F4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GZeRuBL19kEQZ7yUR/wmZNon9fFkezKdrdtBso37/QzIfrTzV7fU5s2JwixFwPHEe
	 cJew1o8O58MC+u2qJkPdOcSj6kPYmqK2+ID5N+lHzTgsJhKf6DZUnMKwIRGyJBNpVE
	 E/zSmQz3k3mWF0bf3kZdsMG/S42aLgjb8tV0K8E1w6SWgej8tgl0JTT9EltmxeAjGZ
	 MImudwv7/iSGjcf3CrqA/3XAiflYD6TABmSxJU4vX1ZMv9/geGs2IzREo3Xxyd5a6E
	 pvQbjEqVZ1XBK/QNrrO5SnX/JVVqY+eIp1HP6H4U4leS7CEdNw0Yb9/TXOKRQHBYbu
	 rL7yU63h31Juw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH WIP v5 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-qcom-cphy-v5-4-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-4-6be0f62b4d65@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 13:51:52 +0000
Message-Id: <20260531135152.9A2681F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional read of uninitialized memory for Gen1 devices.
--

commit 43ee2476cf366ad16e485085006e91fa9ffc5b5b
Author: David Heidelberg <david@ixit.cz>
media: qcom: camss: Initialize lanes after lane configuration is available

This commit moves lane initialization from csiphy_init to
csiphy_lanes_enable, waiting until the d-phy or c-phy lane configuration
is available.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c

[ ... ]

> @@ -1169,6 +1169,100 @@ static int csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
>  	u8 val;
>  	int i;
> =20
> +	switch (csiphy->camss->res->version) {

[ ... ]

> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		if (c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs =3D NULL;
> +			regs->lane_array_size =3D 0;
> +		} else {
> +			regs->lane_regs =3D &lane_regs_sa8775p[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!regs->lane_regs && c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {

[Severity: High]
Will this read uninitialized memory for older devices?

The regs structure is allocated earlier in csiphy_init() using devm_kmalloc=
(),
which does not zero-initialize the memory:

csiphy_init() {
        ...
        regs =3D devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
        if (!regs)
                return -ENOMEM;
        ...
}

For devices that fall into the default switch case, regs->lane_regs
is never explicitly set. This causes the check !regs->lane_regs to evaluate
uninitialized memory.

Could this lead to non-deterministic execution paths and uninitialized memo=
ry
warnings? Would it be safer to allocate regs with devm_kzalloc() or
explicitly set lane_regs to NULL in the default case?

> +		dev_err(dev, "Missing lane_regs definition for C-PHY\n");
> +		return -EINVAL;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-qcom-cphy-=
v5-0-6be0f62b4d65@ixit.cz?part=3D4

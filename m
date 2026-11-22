Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365697;
	b=TCz4Kaaygzeebr+rxL4aT/5xO6tI7oOXAjwr/3rrxy5HYwN9i0YIYBjfh5t8+lWta2ME
	 HWdX+Qj915sF3HoX30a9DGzOvVMgHx24IklL9KYGW1wuxeT0f2o0eEQ0CfVG4SgHgpAUR
	 zlQBibEbA/Emn8l0AkVQ4YMwLUO2a65x61JWWUIGuJhEMSldKXFd4JZWrNLgUvxrLAwZr
	 w2XB3HRHF1+BdwvU+L052rYoo2FRukt0zf7f3FKnL1L41/1z2vH4weHB72a5F8pBck/fd
	 nEudaeyt9KIsVG2eZ81FZJP/lCBVnvWUnv/D8F68Dhu/57Yk2LFQRSmwaaOjyVgKmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365697;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ANyoMJ4I/ZZXkIVeIux+/xReRYj7vye3ccs0ubJ3Xyw=;
	b=0e9OYkHAru/Nf552l4dDnXYvAH4VAfnzYupY/he630Erzabgt3O3a6VqZLUgKXbXmk4e
	 qetVY9H5OZAGgEx2zBz2XPAhAer+40XID1SMmz4uy5P6MrpZuNGfICWdq7KysQv6CRvPB
	 HMKtRi2bEJWYwXjxni3JUAuFTa39uN7+aN32CMTgz1tMweMCh3rdK6phBg1IN2PnDsMTy
	 Q1hD5SA/nwCfNZGwWz4OW+2HOJRY43dMSvpKKdXNvbFgaeoX9KobOjKXa+3mZYP2EBP8i
	 GMAnYe4yiWIJWlnIkj/Rdt3l9bI7g/gqepmN/s2EZNikwIG5Oj7/zNDUNyN38jyYQBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERyyMm6A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9E606A320;
	Sun, 22 Nov 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERyyMm6A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382051F000CA;
	Sun, 22 Nov 2026 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365697;
	bh=ANyoMJ4I/ZZXkIVeIux+/xReRYj7vye3ccs0ubJ3Xyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERyyMm6AnaavY8k/uoU70c0I7e+zy5Jtz9KGcEokl7mSZ8bKpkKhwU6XvGPpIU841
	 HcC6mpcSn4YpN423gWoR8vvCiC4O5i6UZksZIf7kQDGwNdBA1Zn0p6wwVI1j3EOgej
	 p6Czj/jU0ur1qBXLvND05IbSwSgJkY3mgQrmnbtG0lBXxtc+H4nmctHxpcHRMxpp/j
	 Cj1viyhdo6uLniYn523y5cjhZ5CcrutY0Zp3Hr0yCYi90HQ+RBqRMo2X0N7Bx4LR6z
	 vHxLwmITxZ9NEsdRKKCLwHBKp1hG5Gp+Frpt/os6hCKfyEmbLg/wOwxCvT4GtZ33+F
	 /xNgxa+sSWYhw==
Date: Sun, 22 Nov 2026 17:41:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: iris: add support for maili platform
Message-ID: <20261122-mature-rare-saiga-c0d3c0@quoll>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>

On Thu, Nov 19, 2026 at 01:13:23PM +0800, Wangao Wang wrote:
> This series enables the Iris video codec on Maili, allowing Maili to
> use hardware=E2=80=91accelerated video encoding and decoding.
>=20
> Compared to the Iris3 generation, this block has
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - different clocks and reset lines.
>=20
> fluster result:
> H.264:
> Ran 76/135 tests successfully
>=20
> H.265:
> Ran 138/147 tests successfully
>=20
> VP9:
> Ran 235/305 tests successfully
>=20
> Dependency:
> Dependency:
> https://lore.kernel.org/linux-arm-msm/20261103-vpu_iommu_iova_handling-v6=
-0-e4b6ad864f8f@oss.qualcomm.com/

This cannot be applied, not mentioning that itself has dependencies. So
you depend on patches which depend on patches and none of these can be
applied due to conflicts or some other issues.

> https://lore.kernel.org/linux-arm-msm/20260917-glymur-v11-3-e0c8bc914742@=
oss.qualcomm.com/

Also cannot be applied.

> The above patchset cannot apply cleanly; I have rebased it locally and=20
> tested it. And only the third patch from glymur is needed.

Dropping from DT patchwork. Combine with dependencies.

Best regards,
Krzysztof


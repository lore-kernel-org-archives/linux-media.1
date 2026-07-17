Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373E63B6BF2;
	Fri, 17 Jul 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280215; cv=none; b=HzSRyFirsp9KcTHmp1PwTEmFVjefrs/SzpXAft0Mj9+IwTKddK6zbPMJ9oEZcxcuTMAMR5aVuneBHadYG+xAN06uMls9XBx753lxLwLw+dZ3SF6RcHCB9kU6VjwAJQGwG9GdhuYCUMobxKgIoqVgHiyo87RF3tPMy0Cc8UX68Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280215; c=relaxed/simple;
	bh=craOIcZaE0tku9ZRwWpooVPgtkykSLeW2iRO7wbB8Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTj2UJSnOkaFswxg+kJM74zyzgVwZda+ISKyuDeS+ZL5vUHMhPYxdZV4gCFDpj1RE7anknLjTneED+e3GaDArsnZAvQNYXM7YgHir35xwxmnIy58q88V9o4r332YW8BGnZNm+vXJvsF53Hi+G2suC5TyXnAmmUfO/QSJS9CD2w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaCpr8vr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaCpr8vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93F41F000E9;
	Fri, 17 Jul 2026 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784280213;
	bh=XnePX2SJbLySSajE+VoogWZZIYqJ1gUZdPqVFqkq6ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SaCpr8vruS0AqNwulXWOeDbwwn3ARJQMtfkAZkPYjFYsx6DCZOMGiBqrTp/GnulWm
	 zim/8a8bd9+8kQnYfWEcfsSnkb6NpzdEQT57v5h0a7ipqq7xAW2/FTSkXnAUrKuWVe
	 7bMjv0VDUt9rzVIRpDLTh4uu+q19kKB6/h42+bvRQ0Q+Pzp+cb/obiaBB8cEz+U0LH
	 0QPBIJb39Oohtm4LXiOby0QjTJQ3Ya+TizIN5MoE62ihTnI/o8dHNL+T05DIqPB2p6
	 68cT4Sg98TSjZuAGJbhRjly0rcbVunArxlH5Zcv3Bv/sejOtEB9akaaLkhoSh5InuX
	 WIWDH3XJUd3nw==
Date: Fri, 17 Jul 2026 11:23:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Message-ID: <20260717-dashing-goshawk-of-chaos-981ab5@quoll>
References: <20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com>
 <20260717-sk5jn5-v1-1-da610d7fd494@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-sk5jn5-v1-1-da610d7fd494@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 12:08:36PM +0800, Wenmeng Liu wrote:
> +SAMSUNG S5KJN5 CAMERA DRIVER
> +M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +L:	linux-media@vger.kernel.org
> +S:	Supported

> +T:	git git://linuxtv.org/media_tree.git

Drop, unless you have commit rights there.

> +F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
> +

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


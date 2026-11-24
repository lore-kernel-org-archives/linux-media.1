Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532815;
	b=wPnoYvtvjBpVhRm1rUPAowsEkD6+FM8joS0bRC21JFRGBF3wi0DUEtHwFHGWtRKpevAU
	 79WweaAmrXqxnR3x7cYkM61ccpvGXo34DQVPeU3Jq4ILvN54I/FPIdfE5xobUiu2UFl/C
	 EqDBXR6QABd6fteQIoM3h3zasxl0zFNeTxShOROc2hc8eVBeAjSk5c/5GG0Kx+yppM6po
	 GxiAcVuRHjJR5eZ1IgoW7ISSElNAq7WaqP41YWQe7Tp6eyPCQRlCBLbclsA9BxH+R6X03
	 4CXlFiZn5re8tJAj1DW2LdvB6SpW2KfwNfofhchdDin6pkdgUFu7+sjgCLz6dJNt8Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
	b=h8PsT8PedCSMM7L4PeMu6F3kNgEFjdRmUVvGyhend762XgP6Ynh036RZ+K8UVhLpAKaB
	 GtTBNsHk7P3xwwXE9Bs7qvGKvHos+bNyJ3/VDdd3tNltIRk52VOkZgcPQ/UabW6kAg+in
	 LCGY5wRZO1UVDow8fkpF+zMx8xJG28pQbuRfcXfu0LoU7pTCkPmHR3VUosrpVQdFRiX5O
	 qLppPsXM5gwWSfOOTnXuQPy9m3pm1Yd4Gv2tTmJkPWu/6pJud1gpN3sKca0W9CTcY/OYy
	 hb02drP+1veIBKM9wCOftFLZXM+T+trZZZYfLTJArtay509/yXRtoMnopQyuDr8sSOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnvlXEeB;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3B606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 15:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnvlXEeB
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso352154e87.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532813; x=1796137613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
        b=RnvlXEeBifVUQ8kdEff6LkQT0iyz70rl6qmjWB7cGMb+fxvMLZcUQdUewCAZK2jgmZ
         uyAgNcqJEA5LZ8AbCqx8z06KyYov8+5GFBpKwVpH68tDoeMhiczdHWCew15PiwmMpgcz
         63BCA+qvFTOHOwepNqqHoeVWxlkn57Et2BzKO/VGFZIQSLn/u39cU2pDDs7GwfK/+AaB
         e+tTpY24ekUpmMk5x82yMIvNYkk72dtSxs4D7JYhY23ANxn6czXwNZov6EyzWkFwJLVi
         ylMcBN1nY+hckUjtnojsNQkE+uhtJmXYSzrTycddqnIuT0/B5336xi2hqVMpTLoDQlvh
         kpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532813; x=1796137613;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
        b=RcsO65veXZOReCfSvv7Kt/hoEvZf/pFSuAPe2zQXF+YFCGfRRwBGZWGWO4TYN4V1DF
         326wSxeQ+0kB8ZXuFFCZvNtCiktlZIhHfwdG3xDX92Ji5sxigglZhvD3M+wT+Akdbr0r
         NAkGVRnKYYckTf2n8him1ev5vgNtR4BWosDYGpAGj1+84A1qo1MjtR6NffsTZGk/Zyfx
         ZWZIAt2DYchoHoCuPz0d86x8AuTKsVEd2IMp4SNqfE/OzoJ7zjkhCgchJwdAr7br8rmn
         foX87R4o2jtZEbyf1r9Lrc+MIjniD+9hCEE3db/IbJmegpasYy0nyFHB3O0pLG82Npul
         CxlA==
X-Gm-Message-State: APuU4Z+EUGe+0YqM4E4KPW43OyvVdrHaVVa6vZIc9QJaqOSU1cWZXBY7
	hg1HQf5zUyGNcC1r74hyJdXqoB5LErte/aZuy3HIBuzv0ofgd/u9c4og1r9Z+5x1ma0=
X-Gm-Gg: AZFdTZdtudSgCdQNDC6a16Y7Izy52o6osJU6i5JVz6K0xO+kN5sAhlK4ErB6aYhoD7Y
	nOfJu6s+t/cgCd8C3R53LnZAYwSOkPO1KYer2hYirS7qhYvCkD94JnEaXy5G64x3lQoAMYD+Bq7
	4SlU8G4dNpDAgjAMw0Q+QMICePidsp8N9iS1L5KBKHf0Jo6FMR7L26JTeJL//E7vuhosfvy+PSb
	Xq7JsENBzknAVu82rsoubEnD0LBlGywXga6GsP1lgZDs9xB8tfhwU6qNM/RhI9GVsN8uMIvmin2
	rojVDmMNI5+qyzVLyZVjqnDAwQ+vAs4a1N7WqLIzb5r/818YOhXarJ5yeYsKto2wKcsG+/pc7pp
	5aMWk0gZwA+AdXCWQ1kIqjS+YR4GaOJdfaRER0f2H1pLWX27XM49H5SnTwYxL4pdIndEryWrm8S
	GbD4R05V03pvLzkMkVmb45aouzzuxvIXc1ncTz3qlJn56uzk+ngxzQxbsILnqgl0JgVS7e3cAye
	3yiJSfFE7NqzCHqJxTyve23KhsoSRCsNhjfH1YT9QYFfAFnSAf/7FUiS7H/QKVm6migozLlUBYK
	lv3eymvAjvvnf3cyeS0YhB8dfH2z2n9L++NZzKQ7EQuBm2JnnZt6vhaBR9P3XuTiWKQr8idf74Z
	qYIOxMCFLVwePBdDqBAK1bX1/frKC
X-Received: by 2002:a05:6512:23a4:b0:5c1:57b9:90b2 with SMTP id 2adb3069b0e04-5c1bc685e41mr4958216e87.1.1795532813175;
        Tue, 24 Nov 2026 07:06:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff98c6sm4038388e87.25.2026.11.24.07.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:06:52 -0800 (PST)
Message-ID: <769c2dd4-1517-4a45-9694-b65e7b4bfee8@linaro.org>
Date: Tue, 24 Nov 2026 17:06:50 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If we
> find a real use for this we can turn this back on. In the meantime drop the
> definition, it only confuses things.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

Received: from mail-ej2-f28.google.com (mail-ej2-f28.google.com [74.125.228.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE7399CFC
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018299; cv=none; b=bYyKMfHqUZ23ZzVH92RrT8waDId69hOyhCDxlRGgFUYdvbL9/qVtem/73HuMZVtiiN0UVrZSxtmi/HdTO6qo0WmVzggvwOIngxBLeyqtyraxaAzPt/5AxuijerirCNPzqdA68m+9L+eHaW3pNw26X8sgd1SC3Ouri0x0GvFxZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018299; c=relaxed/simple;
	bh=oBAwIlp0EH3iPcRUaPn/NBQX1NuaLsMheNDGOxsCCCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI2nHXG53bqQJQV8606rrRzG7KHc9drEVhp8vWBTwnbE1nN3TVr6Kxr2+QX3xYqFU/2DcisTodMyuRO90t+Xwfb7Oe3NOX3yMBZLQU+b5eOjwqW+NvBLalwRvZzsofAsjsbIEQrXGeTd+2+Baiw1nG/BgHqBBN5HpUJIzjbx+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S06ZJiyU; arc=none smtp.client-ip=74.125.228.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S06ZJiyU"
Received: by mail-ej2-f28.google.com with SMTP id a640c23a62f3a-c2e4a2f00beso88064066b.3
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791018296; x=1791623096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SCNo95/BixJDrCNj1e89Xl9YT1Mqeqtzc6x6damSjo=;
        b=S06ZJiyUNxkTWTJDW9fMCol/9fu1dIy5o87nmR1DS1aFKMyhGm9XeGOIPwjwcE8VTc
         +30aX593eqYqkg0faeA9CGvwuc32zcLfi3LGupK/d+x24+v6tXhAJlwjyniDGLu6VaFm
         wv9eXu1KKhDULReGpw+X4Y8qxEbIui6QaMzN2hhnqqbyr7XL/jHgk+NUb8fzQDm5z1aB
         dO/8th1A1YrqyXzuzCd685r3O70sFoYWPfnvMUAklbvqb76sU5rvvqevwYcRNsglZ16F
         86uBvzR0a/Du6cc0nKqxj/bXjhKWrKjPuUguoNM0StVbS6zQhZ6VOR3u1RmfcZ0tRTOa
         JSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018296; x=1791623096;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SCNo95/BixJDrCNj1e89Xl9YT1Mqeqtzc6x6damSjo=;
        b=mCHehSaB3LN1H+bSqPoE0YCgFIrlbrZHXG5ftlLiPuUasmRjk+e6PYUvB1Vnrv/0D0
         yjOwV6TS4gRKUCUU0WZ6WMc0p+WcQDY5uOqpQyE6obSJzs6z+NqvxIvdurlUY+42nxRf
         pwvRBhtueZei9ig8ySQReDiN6oa0Gj9VvGfjTM3D07sas7X1u7K0O3pKnRd7iYGNyJq4
         BKeH6y2IJTZi9EVubzVtbYOcf2Ayumkt5U/Ioeo5aohCk/b6jgcYUFKVW1StoQJSEoO2
         mIZJNqLvuzvBgqeP7hFjQyl/Ft8DAmC+z3Ycke10avKCs+nCILsUUS8u+hAQLfOj2Jao
         vUGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYn/WSGHM1xOoJ6lBw8bpJycefYXNe/XXBiVjUy/srAJAbPJ6PchwePQ0vW+6v48DZpn/IQMYDdJYXrA==@vger.kernel.org
X-Gm-Message-State: AFuF++m1RlZI5yr+G99yx0Qq/cVBxO/k4YHKy8+KM1EIDsmAooNpRSrl
	VXS3cfViBIZxz3tZeLSzii8oelmzs7bqCHikT1N63TV5bGelFUjWk6nvuiA+xEuxIC8=
X-Gm-Gg: AYBFou3ILoxbK59GMpAAGqCCbMjoIqWRxQGgQSDS2kQ8I2LdNJ2iu8blhkoYXgh3H4f
	+Vnp7HgzhGwPcOeuBg6UmSE7gL3YYj/wW47m7LH3a1km1O4fsD4twZd3UOQPX1V9GdEE6kvnSm2
	qNtMiVfcUmaDC4jQ1h9xAa+KIBYQKHDKZXYmZeN9pLEFSfEYRLDLGTuDjvb6vjv/n3nu8XDFoyV
	lZKeX4F+f/zltqo7RepOfL9vCTPAgpx5i8mK4q/ru1a944RgJjsSjpbcEXbSUFYgXivgBw0CY7w
	CmGOMxM1OgOg4NZpIepZfruArBJ5VfGqQFHGt/bnkmtFKaTrEL38nM7C1f+ApeeRnasyEOT8dF4
	gx48VfNf3uHl76BPUI3+xZVmH1ay0UWVExw9nqqYh82lNndoH4yhmloTZVV213d9USRgAudH3bJ
	eSxYToS6NEQoYPsAEjLA35BcRf0tUAOtwh7Wdm5mukVY673X1U/P0QlNmu0+mlMvSfvK6gZc4bI
	hbLZ3KE05s=
X-Received: by 2002:a17:907:94cd:b0:c2e:3d17:5265 with SMTP id a640c23a62f3a-c2e4acecd07mr452317266b.21.1791018295547;
        Sat, 03 Oct 2026 02:04:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e71d5876fsm48745266b.0.2026.10.03.02.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:04:55 -0700 (PDT)
Message-ID: <86300678-cc2e-48ea-9421-b615dd263f24@linaro.org>
Date: Sat, 3 Oct 2026 10:04:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2026 10:02, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

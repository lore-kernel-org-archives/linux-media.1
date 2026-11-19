Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119613;
	b=xYI1hohMPYPgZRge6tyZ+s17BrQoPW6r2GF+jRRjxw0niXX+1Vu+7xQ6hSgrmx65jLjI
	 q+KdtNSoub5HTZzOS1mGedvHnj074DAssn/1duTdCMpp44P/d8/U0hFIl0+RyuQi182gb
	 ly2G/tbmWjVgJtKL53Tt0PjnfkU20EeEl01jaUWnktQdU68ebS3qm9LGI6d1pV42ejexM
	 4fihoJ3odX0+bciwQ0l9s4rSZq0izKYt3S5Uu46sf4WKo9aVnbL0Kxkm8ytXW6jc0Qpin
	 4mI5k7jH5Tqt/OsaS+vghhmWRKRG0hjd1qUtm/m34D2/wdptQt8aCcsJzQ5S3A8R23w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
	b=QpPhSABZqvqFlNzZtWi/qFLBDuDJkGrapboxoJrAKimXLnmP5FQupS/f8jKmx6YQ0T+F
	 nAhqXW0j9pSX2JISVNHBZGSZ1+mfZDYjsDRs0Ud4PrcdSllttq02aLOkxii1Df50YsDNu
	 K13Tq4Kk7lAcBAkxzvXnNIAJ9kpuKwfmowdY6IMbBlua2mh164bRJCsqX1fXL+ccSZwl/
	 DEeppfLqI7z0e59LuW8BINZIBdCujMCluLf7NRbOUwU+2k1S22Onr2DDN62/iqbuwZaau
	 26wbcNFSyksr5ip/By2lJuzZ5sPNvpJIhxKutIYlda/zFf0Q7pMn2zyoUu/K2sFDLHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRmY0MrQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC73606E4C3
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 20:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC73606E4C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRmY0MrQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so888685e9.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119611; x=1795724411; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=sRmY0MrQcatai13CSp3tCaVymT1Jdx9sG8+PxtJ6vo2v8nOZIgAZr5TMPPHpfiIlo5
         YeuoYsv0bU3CF7cOwhMYGcnJjSdp9bSZnYfiOmii7KSkZaPayIh7i0ubLMe0y/GmTkSl
         UWVRD2/OFS/frqPDCs2oplroD1XKkvFyDNKbMg0NCq1oppThffMV+wUT8ciuERJVLFgz
         SFsPQiffpYXeuwpMZpV27b772hz62Y5powU21nIF3Lch5bw1KmX6DICLJs3U7srUMiEJ
         sTNZPXkPO5oIaA+KlBEbc8bXwD14HR56QIl7P7TplxCLtnEplNpl7O4fCynYkrsTGU0E
         wjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119611; x=1795724411;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=LDP7k9q8N/XS4Jk76FwKIkjLK9v1tDPXPc0JnBDFRKNQwiflMAxnXG2xRsu57xVHHl
         406o2rSpCY0UFdu/Lhwspv2jF9vBCKtDwv5zzmtSZR9kgyLlcg/CbERZ8f43CMHR+KA7
         v1Y08KVuIlYt4HBQPhEU9aNg/A3GmYbkegAVsU3A7mgxX24d2+S99RjH0CI91+/MAV6M
         Aqt9AgJ8EC32RezNJCaoM1h00y2slCOyS5LQ8ESObvGbWU5OuhFW8MyfQCCd++pSwMbg
         EJ8osNLlgpDVqLTCTLsYaw1kMcvhYChGU9VKKvlwf+q0l9azO5XlS4ttYcE9my/XslRF
         wYnw==
X-Forwarded-Encrypted: i=1; AL+hErFs7g7T3hIxH+fO2tMAjGz6RDb2ku3LERtALvx9BxydgHOqdxvE4j8KHEPhxT9OOIRXJl/8UI5XuhKeBQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mEC9lUi45DPg0cF0jwrk3mCqP6MvtN87SG2Y7HKE3NhhFWVkn
	v1l02uP0gTL7qQbJD514Aaaa6vhAfhY9rfq/xSJw09oSHbHmt/y9OD9i
X-Gm-Gg: AYBFou3b4xLSf+CysrsQ3b37fGQjtl/TUzuK+/yzL/qtrJ5+84AOuj2pIOPJ0iWpixX
	5Ko202nU5brETdePp1Ptd/D7SVjk7/MPlOOEG5xJcmiLwA14no6WKaQ4bPRRvpcr6qp4CPZAltW
	Ci/0rEDLauLIhC6Lk3sf0vS5zubEMXbZSnXiBrOjI5WJ2kFKjn0lnOqOUhPlmvA+l6ejlFL3XYk
	EoqdPlyb2urgz8jKQw0SQx4l1tckQcv3Qflph/pngqWSc3DuTeWZlTI+Ze4ZbDZgdABBiZ7Lftq
	VMEXmhKC/xef9YC8TuSnS5odrdqZqxnNn8t5EM3R75lgORcARPSwdCbjnQaG6FCmHcqk8NwnhNw
	3+Yhwa96MQUyvLfFOYNjtTvkLHxfqh1rcOK7i0ouj5prgC3prwch71BFmmmCVJ7mQVYSvA1YBJa
	Ic1oJQ34eAGCIlktiSi3DOEFa/NxnCVTfQLsxKI29uskpwA41pfZ4tZpM7g9zUawAoA+wRi4GJX
	j3t2GX1HT81kGSvJFkxyPnB8OPY8rO7/BKaWJLLKH4jQW4y6a3RhQTrYjFfHICtyA6xdo3/oI4L
	Bu+QpbJYuc1oYGJR4TKP6sP+rNrJez417pZKODdMj3kE4N9HAg8NOTfM9vyFvb46YsvEd0Xm
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr14648215e9.4.1795119610866;
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm94509405e9.4.2026.11.19.12.20.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
Date: Thu, 19 Nov 2026 22:19:57 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <92CE2271-6485-4B33-AF75-480F9BD56980@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Sascha,

On 2026-11-18 14:27, Sascha Hauer wrote:
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

Thanks. A correction to my last mail: 3 bytes per pixel is not a worst
case for 4:2:0, despite what tj3JPEGBufSize() suggests. Since then I
built 4:2:0 test patterns that push the quality 100 scan as far as I
could: libjpeg-turbo writes 3.35 bytes per pixel of scan data, byte
stuffing included, for one of them (640x480), and the Hantro H1
encoder on the RK3026 3.14. At quality 99 the largest I found was 3.08
(libjpeg-turbo) and 2.88 (H1). The patterns, 96x48 and 640x480 JPEGs,
the same frames as raw NV12 and a short script that makes them at any
size, are at https://homenkow.ru/kernel/vpu/

With the Annex K Huffman tables and 8-bit samples, a baseline 4:2:0
scan is at most about 3.3 bytes per pixel before byte stuffing and 4.9
after it, at quality 100 (lower qualities are smaller). Other tables
give a higher bound, and APPn/COM segments add any amount on top, so
for a decoder any fixed factor is a trade-off.

So 3 bytes per pixel covers what the H1 wrote up to quality 99 and most
of its quality 100 frames, but libjpeg-turbo goes over it from quality
99 up. If that trade-off is fine for you, I have no objection; I only
would not call it the worst case in the commit message or a comment.

Sergei

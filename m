Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657122;
	b=NML9OZGe88D+w6mWTBKeNvZ8A1GC+imBfsvYn2wgLf6x9jCyfMyGkHUYrDwWjnjoRKls
	 +gwQ9Wf9A7ssDbJMCTYy4eZkfSi3WdHVNPx+4ZiiUcpdLWSza/ED1u4ulaZ5rFGbNiIjq
	 elAnaEBlWDZ6LshTPtwV+09+OkV9zJWg88lOs39Spjnb/Dpg4609W6PlxrULRDjc0jHmq
	 oFW2ktonVpNKgOJEfe8MQREmi2h1+rHyTagLLF9jEjDVK3HOV836QmEJng/DOmm0DuFIe
	 MnZsQk7C+8uzvmLnxUkT9Fh3kShVtE+R48/fG/4l16D/l0aqcu4aJL+e+jCOTHqN3UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
	b=yI6e4mE2uwXvCooZNk9f/vDIRMMs/m21dfNmcTRowD35yIkqfSebZs5EsblTGu0QxHlI
	 B5C8fiP7YKt23OcBeWZKT4F6ve58PGP7Z4I5oMXerZQueTLSXrh3ZA7abOh7D6V4t9FD7
	 nbyb4kod3YaTwS8V4/gGDp5v+krWiHt274AvhCQIDes9TwVpHQBTnqg3Iu7A2OXVxUISk
	 UNuFTjPFBS2T0J4LFzKNbmHjbsDF2joqK8dFnbon6zkWcCD4qIbQxAmTSfWEtMZBmQLCO
	 D6OtXlig3+I/iRVqMKL9ABiuNo69oZLW8BlSrGPgIBdrPOgr2kXNG3kRhyKixHGHUyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D4606D83D
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5D4606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso6881762eec.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657121; x=1794261921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=PUs3mu89+syzBRQDWzZ5ixeKkYfm7Ii2ag28THP8+Pd9LkZZQOro6Z/HEuWYy7rQEf
         6s25DD6Mt3qyvJ8QfIjMR75zutVoFrxfYCDKAftAiS4v5jL4bj0qUJfNqKmlOqq4zUlR
         RPafHTP0eJY2vVTf9ppyCe+YK8I7tlameB6HcKJqSgVyGEbnjZHG1HK5MEawyr7VMhOX
         8ZTHNrPpSQA5BFgYTbWPLSF/R87ic5NTl3MnIuhRRvJNwFmMfHdviPxnyVboRlWk39Mt
         wghhoMBEaOFeFVHMYbZ2U+snwUafVNI0uu0hGUcxqhrZjFRY9hAWw13syb8TM+TuaWRF
         N4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657121; x=1794261921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=LLoOtlWrOAOtqNpVKUOfyjVMHflyjrkja6Xj0mzi4Lu2Pax9HkmgWDqQGe9amsChXS
         WAc0/fVHwbLay9XAdFUnkV5YBJQJwdSTJVbZPFO7oHBKOB8nKKsjGyM3fNpnn9VWHhfd
         WgfChc9pgOn1wxQVOKWpaGc/ynkt4sMfcpQ67v2omBROb7tWRha29lgjInKV21pWDTJo
         GpdC8pebTD40c6LT8PLCgAwA6B1Jx0DPQnstDEjtNvnGJtINwGIQE5F1/i989NW8Vm43
         IKvozgil73Yuob7x4EYmkiK8D6m+BpZBRAhfK7D3+/usE9IJlT7/FRJlhxOYhQ3b1WN0
         TrLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXSC9lwR/DxU1BSATV6iLagruh1wWjPuaVruI0tBJwLdSvO0v7+9y9x92224lbS5P1/IhCnh6F/sN9bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UgLzrzcJVrJuFP5nuiL+0OTqxZRDpqq2sLaA+Ft7gspMBYOC3
	+sXf8E3H9KrV2BaUOpepYJvZUEKwaebcnheFFSBp07oswQzhDNz0WND4
X-Gm-Gg: AYBFou2hRFQWdvGEJ66PG9OTL080lcsb8JdhjB7H5QaHd1W8IBYt0NU83pCDMDRiM/p
	+5v+81E8KG9XrX/mGRaseuNbyyAhmaCXprDwcliguP/75rN6gKhNLx5pAq2i1f0bn3/k3LNxt2R
	irbxCHwqPq24FINIY4xLXnkGgl9lBliyS6qLQN2v5HP0R3vmcJKbt7VRwrtBiBkByx1tn9UX0Di
	0gshhHxQg6Y2H6JEmj6uArpr5icPRJTs2lB9q4SaSSI8KB4Gg7bx0tppdMqmywpQlQjj/rb6ehB
	SiUbFAg02NR3/Fsfz3l+5EdN4+ORZYUWciP30l7VZcw1qYPKHx/W2iPjm1JVjlPiB9ReGM/w5mU
	oSSAQLW83PieCKph9pX8hHVnyMtujdp9NcoWOClJ8o2u1QTwbYa8ApiE1IvCd8IyRb3/hisX9tq
	MP8jwhUTVtZlVUaHSM28n5v9amtiN5NAdMR42yAAUPlgNTQCCE1zZykrHxiYiIvFWBr2IWD2FhF
	viV0zx8J3beg+CUZgAYIszKz6pjTkvUsiHnZfhd0NQ0G0GN3n2jmUfRjwQRn6BNgIJsDFCuZlFq
	MUYb6LRZo+77Z+DFBXQR49Fkb+5jMAt220h8hCJJ+2+edeNl51oWlbuh5DIZg4Bcjg==
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr24803721eec.37.1793657120646;
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm42657742eec.7.2026.11.02.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	media-ci@linuxtv.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer calculation
Date: Tue,  3 Nov 2026 07:05:19 +0900
Message-ID: <20261102220519.1738-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001153221.4FAC61F000FF@smtp.kernel.org>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com> <20261001153221.4FAC61F000FF@smtp.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:32:20 +0000, sashiko-bot@kernel.org wrote:
> > +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
[...]
> > +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> > +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
[...]
> Does this code multiply dpb_obp by num_vpp_pipes twice?
[...]
> Is this double multiplication intentional, or should one of the
> multipliers be removed to prevent over-allocating the line buffer?

Some data on this from a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), with
this patch on v7.3 and out-of-tree Kaanapali support. Hardware decodes
were compared bit for bit with software decoding:

                             HEVC Main10      HEVC Main
                             1080p   2160p    1080p
  v4 3/6 as is               pass    pass     pass
  dpb_obp multiplied once    fail    fail     pass
  once, OPB lines doubled
  for 10-bit output          pass    pass     pass

The failures are "session error received 0x4000005: insufficient
resources" with no frames decoded.

With num_vpp_pipes = 2, the second multiplication doubles dpb_obp.
That is what 10-bit output needs. With one multiplication, Main10
passes once the size_dpb_opb() part is doubled for a 10-bit capture
format. 8-bit streams pass without that.

Is the second multiplication meant to cover 10-bit output? If not, I
can send the 10-bit sizing as a patch on top of this series.

Thanks,
Joonhoe Kim

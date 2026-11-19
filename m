Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091758;
	b=Z4sJniMM7XFZ7R4tH9J4HDK2pswgSTTr7qu36/bIiVylVLoiNhQAIl8ubyMaO+UIiMkT
	 O1PzxhYibvb3RRRLkIQm4n8CNnUAEtLrjE4pMQ5P1/jRAaESaTOlzXIKlQ+X3qOU/xZ0P
	 AGMMvflYxLkMVoNnWG7kd1yoUUpNQfv+ZtCa0lsz+mgc9fnP6M+gVSI26Wttwdb1VJijk
	 iPrplDPvOeGfKodx6a/4hOQbCyOvV4kDPEKz7BlcKJgfDT8Flhe2gRJsikRlIjd2407u7
	 3qYcwPdIEGOc50sSX4at3iqXU0WDDiMsDWLNU5bmGn/WnRLNFGUZ5Dh5d9xUTdabQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tlh0sDqeWlrC+CughwxhHDNVvfwaR9aGAXcv08hxMJg=;
	b=HfaZmhZkLf+iA/7rYbzVhV5WvHM33Iu4QZzImO8tFIT4T0meQunAtdKaMqsJ7BtdLrHa
	 IisuJazMCDZny0IQ8aAMHBdMaM1kKk+UQiElQ0L20bDDK01HFQm6eQqkrUZuPy7KRe1Ew
	 io5ZYBeVoDr6VTUGQ9XupMzfCYO5u9JmKjx1PiJ6vPbY4XlJtFKhRBUiFu/hbIM3GeDcE
	 oIqtkbQbXdpHoJEhjltO66qmEYC+81PG/My/uTcgz3oXOtPjqhM4O4YTOADCNOo+GseHr
	 UQFmvngiwosdnin/S7nrQncEfQPpsYxNY6/0FMESFiAx/D6sukYGOJw99ghA9B/VA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyEHCG7D;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6872606A325
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 12:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6872606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyEHCG7D
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so2960440eec.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091757; x=1795696557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tlh0sDqeWlrC+CughwxhHDNVvfwaR9aGAXcv08hxMJg=;
        b=NyEHCG7DVoNCj5XQjqnUzUKFjPI7k/LKK/dVBRMfe/Fjv8BNLzGJmk2y+wNXFgk6Jx
         lMfEf5G9IsQjJmsrmB8jsDCOb1D3HC2uaWLqdqX8U6zWCsFqUucGwof+50UFwNKKm2e3
         9u4lmcYidTcNGPE69H8nyy0/S5ssQICabReyhztN90UWyRLiSSpnZb3FoSwJEd04UJ8J
         tTPQIDjwd9XFeERuy4TbmByegYnuWvwTZ2qivoX63pjiakxiv1QUcN+8KrdCC/sadozc
         F2P8bQQdVtfeICrVLQHHGIVG5E1UBEhW0bQvacunwWLGO4Pik76bVRsZ3b66QeMOeEsF
         g7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091757; x=1795696557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlh0sDqeWlrC+CughwxhHDNVvfwaR9aGAXcv08hxMJg=;
        b=xvRBmIfTgsMBFLfthEfPUcqY49QzNfMpc+ecSDeQACBDpAhav21WM7uSBxlm2T6oKJ
         ZskAY7dqU2PyPrfS3Iq/dCy6rrfM1LK+vm8Wo09rLy8btHsUSw+KIfHRXdkIM7pTmhvg
         xnNUxjXrlgz7Rs1hJUxDN2o01cUEd6P/t4+3yCjwassAZlPZRsp8jrP7qttJ22uypgUA
         0BNYmfUUQoLaEJRDLpOHZ3ajazxhcGz3fhSoBDcD+76tO0B/kbgpY11WGNu8Iweexjx/
         PAFf/DUfnRh93QFPzH7SJO4CAJeaqXJbc9rYqrw3zQdmLv7Vfqck//ML+NtAxSSsgis6
         7fWw==
X-Forwarded-Encrypted: i=1; AL+hErH0KCw8d01XURo6PORKfMpdzGfF3T+yld8QEwhxWuPeTqN0aKd/J0I7jNAKdxKdFOG5Bok4REVKiC8slg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/r1wQTqHt7jJJDlvGkoikG9d66Xyc7BC+vZAAxMde+9GS42b9/
	jthuAH4cEiRIUby7IW4p9StbAfkdXR8RY3cllvKHNiEOCXqAMd9kXLhy
X-Gm-Gg: AZFdTZfl7urjYOana66LPugMoJpK3SslM7lONa7NKDZfhJvs+mriZW/JQWScDynphK/
	Ic5B5vgZYYCFOJXZQKep2gYc8XAQiN9YsmB06Pt6Pi9cyAJ2j8UhIhahL2db1iAJi9g3Mt0KHIo
	L9W7kbpf/VronwcvAKay/pp3aB3EPMpaq/NvEiE4MNuQMbLYZ49eKPJh87ZBmlwIPa6t3Yd82m4
	rNYEUkGuLEDxA8vamqe1AMzsOIKu+vNL6sv9JBJBZtAkMDJeTGXOuSpVnM+0Jog3G9orFRqms4i
	LRXHebmNHSG/EK4hiH6T1sRMz8e4MTixzqXSfzGZC1mDyCTAG85SWmZ1w2rHZqizRBKI0DTQEJE
	ppnEYjiNH+3jjNwDLUhCdV7vwv1fA5XHWRDR1ouOKuP/HABVRv0dTs3Ne7v49CsT7HR/AJHToi5
	DNzE+wnf+DeIHluhASPFDIzWFeadl6D4bYiROYkfj7tnAPaHhwjec3gJJsvBRgoBlU2EjvHo3ju
	kGnAnLbvXfILDzXNJLOZ8FnWIX56wIcHlZqBs2l0fA2fNVUDteSyGDcYKpq6MDfWx5qbC7p9wsk
	PTgqD6dPvrkswRwY3WNiSnGyQpsmSJl2HTjQTM5t5lWEwU7gpfsGpQ==
X-Received: by 2002:a05:7300:b594:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38281eebbb1mr6690547eec.39.1795091757005;
        Thu, 19 Nov 2026 04:35:57 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm26605762eec.5.2026.11.19.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:35:56 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: venus: hfi: check the write index against the queue size
Date: Thu, 19 Nov 2026 20:35:52 +0800
Message-Id: <20261119123552.1378131-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_write_queue() takes read_idx, write_idx and q_size from the queue
header in memory that the firmware also writes. It checks q_size and the
write pointer against the queue memory size, but not write_idx against
q_size.

If q_size is below write_idx, len in the wrap branch underflows, so
memcpy() is asked to copy almost 4 GiB. It reads past the end of the
packet.

Return -EINVAL when write_idx is not below q_size.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer, which reports
nothing with this patch. Not tested on hardware, only compile-tested
with W=1 on next-20261116.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Cc: stable@vger.kernel.org
Co-developed-by: Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>
Signed-off-by: Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/media/platform/qcom/venus/hfi_venus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e77f6..662b7e89a53229d 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -190,6 +190,9 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
 	if (qsize > IFACEQ_QUEUE_SIZE / 4)
 		return -EINVAL;
 
+	if (wr_idx >= qsize)
+		return -EINVAL;
+
 	if (wr_idx >= rd_idx)
 		empty_space = qsize - (wr_idx - rd_idx);
 	else

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

